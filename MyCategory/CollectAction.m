//
//  CollectAction.m
//  MyCategory
//
//  Created by Developer on 15/4/29.
//  Copyright (c) 2015年 Developer. All rights reserved.
//

#import "CollectAction.h"

@implementation CollectAction

//画线
/**
 *  百度地图画线
 */
//-(void)configureRoutes
//{
//    NSUserDefaults *userdefaul = [NSUserDefaults standardUserDefaults];
//    NSArray *longitudeandlatitude = [[userdefaul objectForKey:@"alldataDict"]objectForKey:[NSString stringWithFormat:@"longitudeandlatitude%@",_startTime]];
//    
//    // define minimum, maximum points定义最小值,最大值点
//    BMKMapPoint northEastPoint;
//    
//    BMKMapPoint southWestPoint;
//    
//    
//    //    char*str=(char *)malloc(8);
//    BMKMapPoint* pointArray = (BMKMapPoint *)malloc(sizeof(CLLocationCoordinate2D) * longitudeandlatitude.count);
//    
//    for(int idx = 0; idx < longitudeandlatitude.count; idx++)
//    {
//        CLLocationDegrees latitude  = [longitudeandlatitude[idx][1] floatValue];
//        CLLocationDegrees longitude = [longitudeandlatitude[idx][0] floatValue];
//        
//        // create our coordinate and add it to the correct spot in the array 创建我们的坐标数组中,并将它添加到正确的位置
//        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
//        BMKMapPoint point = BMKMapPointForCoordinate(coordinate);
//        
//        // if it is the first point, just use them, since we have nothing to compare to yet. 如果是第一点,只使用他们,因为我们没有比较
//        if (idx == 0) {
//            northEastPoint = point;
//            southWestPoint = point;
//        } else {
//            if (point.x > northEastPoint.x)
//                northEastPoint.x = point.x;
//            if(point.y > northEastPoint.y)
//                northEastPoint.y = point.y;
//            if (point.x < southWestPoint.x)
//                southWestPoint.x = point.x;
//            if (point.y < southWestPoint.y)
//                southWestPoint.y = point.y;
//        }
//        
//        pointArray[idx] = point;
//    }
//    //表示路由的数据点
//    if (self.routeLine) {
//        //在地图上移除已有的坐标点
//        [self.mapView removeOverlay:self.routeLine];
//    }
//    
//    self.routeLine = [BMKPolyline polylineWithPoints:pointArray count:longitudeandlatitude.count];
//    
//    // add the overlay to the map.覆盖添加到地图
//    if (nil != self.routeLine) {
//        [self.mapView addOverlay:self.routeLine];
//    }
//    
//    // clear the memory allocated earlier for the points,清楚点的早些时候分配的内存
//    free(pointArray);
//}

@end
