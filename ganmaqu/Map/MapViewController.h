//
//  MapViewController.h
//  ganmaqu
//
//  Created by LiBin on 15/5/19.
//  Copyright (c) 2015年 LiBin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>
@interface MapViewController : UIViewController <BMKMapViewDelegate>

@property (strong,nonatomic) BMKMapView *mapView;
@property (strong,nonatomic) NSArray    *places;

@end
