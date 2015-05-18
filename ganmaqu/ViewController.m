//
//  ViewController.m
//  ganmaqu
//
//  Created by LiBin on 14/10/27.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import "ViewController.h"
#import "AppUtility.h"
#import "AFNetworking.h"
#import "CirclePopUpViewController.h"
#import "CircleGridViewController.h"
#import "ResultViewController.h"
#import "Place.h"
#import "JSONKit.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton               *recommandButton;
@property (strong, nonatomic) IBOutlet UIButton               *typeButton;
@property (strong, nonatomic) IBOutlet UIImageView            *rightCloudImageView;
@property (strong, nonatomic) IBOutlet UIImageView            *leftCloudImageView;
@property (strong, nonatomic) IBOutlet UIButton *confirmButton;
@property (strong, nonatomic) UIAlertView            *alert;
@property (strong, nonatomic) UIAlertView            *secondalert;
@property (strong, nonatomic) BMKLocationService     *locService;
@property (nonatomic, assign) CLLocationCoordinate2D locationCoordinate;
@property (strong, nonatomic) NSString  *circleLat;
@property (strong, nonatomic) NSString  *circleLng;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *identifier = [[NSBundle mainBundle] bundleIdentifier];
    NSLog(@"%@",identifier);
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        self.navigationController.navigationBar.translucent = NO;
    }
    _locService = [[BMKLocationService alloc]init];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [_locService startUserLocationService];
    });

    self.recommandButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.useBlurForPopup = YES;
    [self setWidget];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _locService.delegate = self;
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    _locService.delegate = nil;
}
/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)willStartLocatingUser
{
    NSLog(@"start locate");
}
/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    if ( CLLocationCoordinate2DIsValid(userLocation.location.coordinate)) {
        self.locationCoordinate = userLocation.location.coordinate;
        [self requestCurrentCircle];
        [self.locService stopUserLocationService];
    }
    //[_mapView updateLocationData:userLocation];
}
/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showCircles:(id)sender {
    [self getCircles];
}
- (IBAction)popupTypeSelectAlertView:(id)sender {
   
     self.alert = [[UIAlertView alloc]initWithTitle:@"请选择出行类型" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"亲子出行", @"朋友出行", @"情侣出行",nil];
    [self.alert show];
}
- (IBAction)enterResultPage:(id)sender {
    //    CircleGridViewController *controller = [[CircleGridViewController alloc]init];
    //    [self presentViewController:controller animated:YES completion:nil];
   // ResultViewController *resultViewController = [[ResultViewController alloc]init];
  
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
   
    //NSLog(@"clickButtonAtIndex:%ld",(long)buttonIndex);
    //NSLog(@"text %@",[self.alert buttonTitleAtIndex:buttonIndex]);
    if (buttonIndex > 0) {
        [self.typeButton setTitle:[self.alert buttonTitleAtIndex:buttonIndex] forState:UIControlStateNormal] ;
    }
   }
- (void)setWidget
{
    //设置推荐商圈按钮样式
    //CGRect recommandFrame ;
    //recommandFrame = self.recommandButton.frame;
    //recommandFrame.size.width = 1000.0;
    //self.recommandButton.frame = recommandFrame;
    //[self.recommandButton setBackgroundColor:[UIColor ]];
    _recommandButton.backgroundColor = UIColorFromRGB(0xffbb33);
    _recommandButton.layer.cornerRadius = 3.0;
    _typeButton.backgroundColor = UIColorFromRGB(0x99cc00);
    _typeButton.layer.cornerRadius = 3.0;
    [self setLeftCloudAnimation];
    [self setRightCloudAnimation];
    
}

- (void)setLeftCloudAnimation
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:4.0];
    [UIView setAnimationRepeatCount:20.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatAutoreverses:YES];

    CGRect rightFrame = self.rightCloudImageView.frame;
    rightFrame.origin.x -= 50;
    [self.rightCloudImageView setFrame:rightFrame];
    [UIView commitAnimations];
}
- (void)setRightCloudAnimation
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:4.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:20.0f];

    CGRect leftFrame = self.leftCloudImageView.frame;
    leftFrame.origin.x += 50;
    [self.leftCloudImageView setFrame:leftFrame];
    [UIView commitAnimations];
    
}

- (void)getCircles
{
  //    NSArray *array = [[NSArray alloc]initWithObjects:@"first",@"second",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third",@"third" ,nil];
//    SamplePopupViewController *samplePopupViewController = [[SamplePopupViewController alloc] initWithNibName:@"SamplePopupViewController" bundle:nil];
//    [self presentPopupViewController:samplePopupViewController animated:YES completion:nil];
//    [self setUseBlurForPopup:YES];
   
     CirclePopUpViewController *popupViewController = [[CirclePopUpViewController alloc]init];
    popupViewController.parentDelegate = self;
    [self presentPopupViewController:popupViewController animated:YES completion:nil];
//    CircleGridViewController *controller = [[CircleGridViewController alloc]init];
//    [self presentViewController:controller animated:YES completion:nil];
 
}

- (void)dismissPopup
{
    [self dismissPopupViewControllerAnimated:YES completion:nil];
}
- (void)changeCircle:(NSString *)circleName
{
    [_recommandButton setTitle:circleName forState:UIControlStateNormal];
}
#pragma mark 网络交互
/**
 *  获取当前商圈
 */
-(void)requestCurrentCircle
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *parameters = @{@"city": CITY,@"pos_x": [NSString stringWithFormat:@"%lf",self.locationCoordinate.longitude],@"pos_y":[NSString stringWithFormat:@"%lf",self.locationCoordinate.latitude]};
    NSString *requestURL = [IPADDRESS stringByAppendingString:@"/?command=getshopcircle"];
    __weak typeof(self) weakMe = self;
    [manager GET:requestURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        __strong typeof(self) strongMe = weakMe;
        NSString *circle = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"获取当前商圈: %@", circle);
        strongMe.recommandButton.titleLabel.text = circle;
        [strongMe requestCircleLocation:circle];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"requestCurrentCircle Error: %@", error);
    }];
}

/**
 *  获取整条出行路线
 */

-(void)requestFullRoute
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *parameters = @{@"type" : self.typeButton.titleLabel.text,@"pos_x": self.self.circleLng,@"pos_y":self.circleLat,@"json" : @"[]",@"id" : @"root",@"command": @"full"};
    __weak typeof(self) weakMe = self;
    [manager POST:IPADDRESS parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        __strong typeof(self) strongMe = weakMe;
        NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        ResultViewController *resultViewController = (ResultViewController*)[storyboard instantiateViewControllerWithIdentifier:@"resultController"];
        resultViewController.places = [self parseRouteJSON:responseString];
        resultViewController.type = self.typeButton.titleLabel.text;
        [strongMe.navigationController pushViewController:resultViewController animated:YES];
        
        //[self parseRouteJSON:responseString];
        NSLog(@"routeJSON : %@",responseString);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"request full route error : %@",error);
    }];
}

-(void)requestCircleLocation : (NSString *)circle
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSDictionary *parameters = @{@"city": CITY,@"circleName":circle};
    NSString *requestURL = [IPADDRESS stringByAppendingString:@"/?command=circlepos"];
    __weak typeof(self) weakMe = self;
    [manager GET:requestURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        __strong typeof(self) strongMe = weakMe;
        NSLog(@"circle locatino : %@",responseObject);
         NSDictionary *dic = responseObject;
        strongMe.circleLat = dic[@"lat"];
        strongMe.circleLng = dic[@"lng"];
        [strongMe requestFullRoute];
        }
        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"requestCircleLocation Error: %@", error);
    }];
}
//- (NSString *)requestCircleJSON
//{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    NSDictionary *parameters = @{@"foo": @"bar"};
//    [manager POST:@"http://example.com/resources.json" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
//}
- (NSMutableArray *)parseRouteJSON :(NSString *)result
{
    NSData *resultData = [result dataUsingEncoding: NSUTF8StringEncoding];
//    NSDictionary *resultDict  = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableLeaves error:nil];
//    NSDictionary *placeResult = resultDict[@"data"];
    NSArray *jsonArray = [resultData objectFromJSONData];
    NSMutableArray *places = [[NSMutableArray alloc]init];
    for (NSDictionary *placeDict in jsonArray) {
        Place *place = [[Place alloc]initWithDictionary:placeDict];
        [places addObject:place];
        //NSLog(@"placeDict : %@",placeDict[@"address"]);
    }

    return places;
    
}
@end
