//
//  MapViewController.m
//  ganmaqu
//
//  Created by LiBin on 15/5/19.
//  Copyright (c) 2015年 LiBin. All rights reserved.
//

#import "MapViewController.h"
#import "Place.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

-(BMKMapView *)mapView
{
    if (!_mapView) {
        _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self.view addSubview:_mapView];
        Place *firstPlace = [self.places firstObject];
        CLLocationCoordinate2D position = CLLocationCoordinate2DMake(firstPlace.lat, firstPlace.lng);
        _mapView.centerCoordinate = position;
        _mapView.zoomLevel  = 16;
        [self addPlacesPinsInMap];
    }
    return _mapView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated {
    [self.mapView viewWillAppear];
    self.mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}

-(void)viewWillDisappear:(BOOL)animated {
    [self.mapView viewWillDisappear];
    self.mapView.delegate = nil; // 不用时，置nil
}
- (void)dealloc {
    if (_mapView) {
        _mapView = nil;
    }
}

#pragma mark - BMKMapViewDelegate

- (void)mapViewDidFinishLoading:(BMKMapView *)mapView {
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"BMKMapView控件初始化完成" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//    [alert show];
//    alert = nil;
    NSLog(@"地图加载完成");
    
}


-(void)addPlacesPinsInMap
{
    for (Place *place in self.places) {
        BMKPointAnnotation *annotation = [[BMKPointAnnotation alloc]init];
        annotation.coordinate = CLLocationCoordinate2DMake(place.lat, place.lng);
        NSMutableString *string = [[NSMutableString alloc]init];
        [string appendString:@"["];
        [string appendString:place.detailType];
        [string appendString:@"]"];
        [string appendString:place.name];
        annotation.title = string;
        [self.mapView addAnnotation:annotation];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
