//
//  DynamicsVC.m
//  MyCategory
//
//  Created by Developer on 15/5/22.
//  Copyright (c) 2015年 Developer. All rights reserved.
//

#import "DynamicsVC.h"

/**
 *  物理感应动画
 */
@interface DynamicsVC () <UIDynamicAnimatorDelegate, UICollisionBehaviorDelegate>
{
    CGRect firstFrame;
    UIAttachmentBehavior *attachmentBehavior;
}
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation DynamicsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    firstFrame = _redView.frame;
    [self pushDynamics];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


/**
 *  UIDynamicItem：用来描述一个力学物体的状态，其实就是实现了UIDynamicItem委托的对象，或者抽象为有面积有旋转的质点；
 *  UIDynamicBehavior：动力行为的描述，用来指定UIDynamicItem应该如何运动，即定义适用的物理规则。一般我们使用这个类的子类对象来对一组UIDynamicItem应该遵守的行为规则进行描述；
 *  UIDynamicAnimator；动画的播放者，动力行为（UIDynamicBehavior）的容器，添加到容器内的行为将发挥作用；
 *  ReferenceView：等同于力学参考系，如果你的初中物理不是语文老师教的话，我想你知道这是啥..只有当想要添加力学的UIView是ReferenceView的子view时，动力UI才发生作用。
 */

/**
 *  匀速下下掉
 */
- (void)uniformVelocityDown
{
    /**
     *  1.以现在ViewController的view为参照系（ReferenceView），来初始化一个UIDynamicAnimator。
     *  2.然后分配并初始化一个动力行为，这里是UIGravityBehavior，将需要进行物理模拟的UIDynamicItem传入。UIGravityBehavior的initWithItems:接受的参数为包含id的数组，另外UIGravityBehavior实例还有一个addItem:方法接受单个的id。就是说，实现了UIDynamicItem委托的对象，都可以看作是被力学特性影响的，进而参与到计算中。UIDynamicItem委托需要我们实现bounds，center和transform三个属性，在UIKit Dynamics计算新的位置时，需要向Behavior内的item询问这些参数，以进行正确计算。iOS7中，UIView和UICollectionViewLayoutAttributes已经默认实现了这个接口，所以这里我们直接把需要模拟重力的UIView添加到UIGravityBehavior里就行了。
     *  3.把配置好的UIGravityBehavior添加到animator中。
     *  4.strong持有一下animator，避免当前scope结束被ARC释放掉（后果当然就是UIView在哪儿傻站着不掉）
     */
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[_redView]];
    [animator addBehavior:gravityBehavior];
    self.animator = animator;
}

/**
 *  碰撞
 */
- (void)collidDown
{
    _redView.transform = CGAffineTransformRotate(_redView.transform, 45);
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[_redView]];
    [animator addBehavior:gravityBehavior];
    
    /**
     *  添加碰撞,并设置碰撞范围
     *  另外你还可以使用setTranslatesReferenceBoundsIntoBoundaryWithInsets:这样的方法来设定某一个区域作为碰撞边界，更复杂的边界可以使用addBoundaryWithIdentifier:forPath:来添加UIBezierPath，或者addBoundaryWithIdentifier:fromPoint:toPoint:来添加一条线段为边界，详细地还请查阅文档
     */
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[_redView]];
    //碰撞范围
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:collisionBehavior];
    collisionBehavior.collisionDelegate = self;
    
    self.animator = animator;
}

/**
 *  UIAttachmentBehavior 描述一个view和一个锚相连接的情况，也可以描述view和view之间的连接。attachment描述的是两个点之间的连接情况，可以通过设置来模拟无形变或者弹性形变的情况（再次希望你还记得这些概念，简单说就是木棒连接和弹簧连接两个物体）。当然，在多个物体间设定多个；UIAttachmentBehavior，就可以模拟多物体连接了..有了这些，似乎可以做个老鹰捉小鸡的游戏了- -…
 *  UISnapBehavior 将UIView通过动画吸附到某个点上。初始化的时候设定一下UISnapBehavior的initWithItem:snapToPoint:就行，因为API非常简单，视觉效果也很棒，估计它是今后非游戏app里会被最常用的效果之一了；
 *  UIPushBehavior 可以为一个UIView施加一个力的作用，这个力可以是持续的，也可以只是一个冲量。当然我们可以指定力的大小，方向和作用点等等信息。
 *  UIDynamicItemBehavior 其实是一个辅助的行为，用来在item层级设定一些参数，比如item的摩擦，阻力，角阻力，弹性密度和可允许的旋转等等
 */

/**
 *  吸附,跟着手指移动
 */
- (void)adsorbDown
{
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UICollisionBehavior *collisionBehavior  = [[UICollisionBehavior alloc] initWithItems:@[_redView]];
    
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior: collisionBehavior];
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[_redView]];
    [animator addBehavior:gravityBehavior];
    
    self.animator = animator;
    
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.view addGestureRecognizer:panGR];
}

- (void)panGesture:(UIPanGestureRecognizer *)panGR
{
    CGPoint boxLocation = [panGR locationInView:_redView];
    CGPoint location = [panGR locationInView:self.view];
    
    if (panGR.state == UIGestureRecognizerStateBegan)
    {
        UIOffset squareCenterPoint = UIOffsetMake(boxLocation.x - CGRectGetMidX(_redView.bounds), boxLocation.y - CGRectGetMidY(_redView.bounds));
        
        attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:_redView
                                                       offsetFromCenter:squareCenterPoint
                                                       attachedToAnchor:location];
        attachmentBehavior.damping = 0.5;
        attachmentBehavior.frequency = 0.8;
        
        [self.animator addBehavior:attachmentBehavior];
        
    }
    else if (panGR.state == UIGestureRecognizerStateEnded)
    {
        [self.animator removeBehavior:attachmentBehavior];
    }
    else if (panGR.state == UIGestureRecognizerStateChanged)
    {
        [attachmentBehavior setAnchorPoint:[panGR locationInView:self.view]];
    }
}

/**
 *  推动
 */
- (void)pushDynamics
{
//    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[_redView]
//                                                                    mode:UIPushBehaviorModeInstantaneous];
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
//    [animator addBehavior:pushBehavior];
    self.animator= animator;
    
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panPushGesture:)];
    [self.view addGestureRecognizer:panGR];
}

- (void)panPushGesture:(UIPanGestureRecognizer *)panGR
{
    CGPoint velocity = [panGR velocityInView:self.view];
    CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
    
    if (magnitude > 200.f)
    {
        UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[_redView]
                                                                        mode:UIPushBehaviorModeInstantaneous];
        pushBehavior.pushDirection = CGVectorMake(velocity.x/10, velocity.y/10);
        pushBehavior.magnitude = magnitude / 2.0f;
        
        [self.animator addBehavior:pushBehavior];
        
        // UIDynamicItemBehavior 其实是一个辅助的行为，用来在item层级设定一些参数，比如item的摩擦，阻力，角阻力，弹性密度和可允许的旋转等等
        NSInteger angle = arc4random_uniform(20) - 10;
        
        UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[_redView]];
        itemBehavior.friction = 0.2;
        itemBehavior.allowsRotation = YES;
        [itemBehavior addAngularVelocity:angle forItem:_redView];
        [self.animator addBehavior:itemBehavior];
        
        [self performSelector:@selector(resetDemo) withObject:nil afterDelay:0.4];
    }
}

- (void)resetDemo
{
    XSZMLog(@"resetDem0");
    _redView.frame = firstFrame;
}

@end
