//
//  CirclePopUpViewController.m
//  ganmaqu
//
//  Created by LiBin on 14/11/5.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import "CirclePopUpViewController.h"
#import "CircleGridViewController.h"
#import "AppUtility.h"


@interface CirclePopUpViewController ()

@property (strong,nonatomic) CircleGridViewController *gridViewController;
@property (strong,nonatomic) NSMutableArray* circleArray;
@property (strong,nonatomic) UIButton *backButton;
@end

@implementation CirclePopUpViewController
- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   
    _backButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
    _backButton.backgroundColor = [UIColor greenColor];
    [_backButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    NSLog(@"before init cell");

     [self parseCirclesJSON];
    self.gridViewController = [[CircleGridViewController alloc]initWithCircle:_circleArray];
//    if (_circleArray) {
//         [self.gridViewController setCircleArray:_circleArray];
//    }
//
    self.gridViewController.gridView.frame = CGRectMake(0.0, 50.0, 200.0, 200.0);
   
    [self.view addSubview:_gridViewController.gridView];
    [self.view addSubview:_backButton];
    [_gridViewController.gridView reloadData];
    CGPoint centerPoint =self.view.center;
    
    NSLog(@"center Y :%lf" ,self.view.center.y);
    _gridViewController.gridView.center = centerPoint;
    NSLog(@"center Y grid :%lf" ,_gridViewController.gridView.center.y);
   // [self addChildViewController:_gridView];
    
    
    
}
-(void) viewDidLoad
{
    [super viewDidLoad];
        
    
}
// 点击事件
- (IBAction)buttonPress:(id)sender {

    NSLog(@"button pressed!");
    //[self.presentedViewController dismissPopupViewControllerAnimated:YES completion:nil];
    [self.popUpDismissDelegate dismissPopup];

}

-(void) parseCirclesJSON
{
    _circleArray = [NSMutableArray arrayWithCapacity:10];
    NSString *result = CIRCLES;
    NSData *resultData = [result dataUsingEncoding: NSUTF8StringEncoding];
    NSDictionary *resultDict  = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"result :%@",[resultDict objectForKey:@"success"]);
    NSArray *circleDictArray = [resultDict objectForKey:@"circles"];
    for (NSDictionary *circleDict in circleDictArray)
    {
        NSLog(@"circle %@",[circleDict objectForKey:@"circleName"]);
        NSString *circleName = [circleDict objectForKey:@"circleName"];
        [_circleArray addObject:circleName];
    }
    NSLog(@"array count %lu",_circleArray.count);
    
}
@end
