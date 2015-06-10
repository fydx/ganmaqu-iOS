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
#import "CircleGridViewCell.h"


@interface CirclePopUpViewController ()

@property (strong,nonatomic) CircleGridViewController *gridViewController;

@property (strong,nonatomic) UIButton                 *backButton;
@end

@implementation CirclePopUpViewController
- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//   
//    _backButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 200, 300)];
//    _backButton.backgroundColor = [UIColor blackColor];
//    _backButton.titleLabel.text = @"返回";
//    _backButton.titleLabel.textColor = [UIColor whiteColor];
//    _backButton.titleLabel.font = [UIFont systemFontOfSize:12.f];
//    [_backButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 40, 80)];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"返回";
    label.textColor = [UIColor whiteColor];
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonPress:)];
    //_backButton.titleLabel.font = [UIFont systemFontOfSize:12.f];
    [label setUserInteractionEnabled:YES];
    [label addGestureRecognizer:tap];
    [self.view addSubview:label];
    //NSLog(@"before init cell");

    //[self parseCirclesJSON];
   // self.gridViewController = [[CircleGridViewController alloc]initWithCircle:_circleArray];
    // 1.创建流水布局
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 2.设置每个格子的尺寸
      layout.itemSize = CGSizeMake(85, 30);

    // 3.设置整个collectionView的内边距
    CGFloat paddingY = 7;
    CGFloat paddingX = 10;
    layout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
    
    // 4.设置每一行之间的间距
    layout.minimumLineSpacing = paddingY;
    self.gridViewController = [[CircleGridViewController alloc]initWithCollectionViewLayoutAndCircle:layout circle:self.circles];
    [self.gridViewController.collectionView registerClass:[CircleGridViewCell class] forCellWithReuseIdentifier:@"PlainCellIdentifier"];
    self.gridViewController.view.frame = CGRectMake(0.0, 0.0, 310.0, 500.0);
    [self.gridViewController.collectionView setBackgroundColor:[UIColor clearColor]];
    self.gridViewController.popupDismissProtocol = self.parentDelegate;
    self.gridViewController.selectCircleProtocol = self.parentDelegate;
    [self.view addSubview:_gridViewController.view];
    //[self.view addSubview:_backButton];
    [_gridViewController.collectionView reloadData];
    CGPoint centerPoint =self.view.center;
    _gridViewController.collectionView.center = centerPoint;
    
}
-(void) viewDidLoad
{
    [super viewDidLoad];
        
    
}
// 点击事件
- (IBAction)buttonPress:(id)sender {

    //NSLog(@"button pressed!");
    //[self.presentedViewController dismissPopupViewControllerAnimated:YES completion:nil];
    [self.parentDelegate dismissPopup];
}

//-(void) parseCirclesJSON
//{
//    _circleArray = [NSMutableArray arrayWithCapacity:10];
//    NSString *result = CIRCLES;
//    NSData *resultData = [result dataUsingEncoding: NSUTF8StringEncoding];
//    NSDictionary *resultDict  = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableLeaves error:nil];
//    NSArray *circleDictArray = [resultDict objectForKey:@"circles"];
//    for (NSDictionary *circleDict in circleDictArray)
//    {
//        NSString *circleName = [circleDict objectForKey:@"circleName"];
//        [_circleArray addObject:circleName];
//    }
//    
//}
@end
