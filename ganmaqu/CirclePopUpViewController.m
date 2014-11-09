//
//  CirclePopUpViewController.m
//  ganmaqu
//
//  Created by LiBin on 14/11/5.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import "CirclePopUpViewController.h"
#import "CircleGridViewController.h"
@interface CirclePopUpViewController ()

@property (strong,nonatomic) CircleGridViewController *gridViewController;

@end

@implementation CirclePopUpViewController
- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   
    self.gridViewController = [[CircleGridViewController alloc]init];
    self.gridViewController.gridView.frame = CGRectMake(0.0, 50.0, 200.0f, 700.0f);
    [self.view addSubview:_gridViewController.gridView];
    [_gridViewController.gridView reloadData];
    CGPoint centerPoint = _gridViewController.gridView.center;
    centerPoint.x = self.view.center.x;
    _gridViewController.gridView.center = centerPoint;
   // [self addChildViewController:_gridView];

    
    
}
-(void) viewDidLoad
{
    [super viewDidLoad];
   
    
}
@end
