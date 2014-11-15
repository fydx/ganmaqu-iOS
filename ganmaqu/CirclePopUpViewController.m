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
    self.gridViewController = [[CircleGridViewController alloc]initWithCollectionViewLayoutAndCircle:layout circle:_circleArray];
    [self.gridViewController.collectionView registerClass:[CircleGridViewCell class] forCellWithReuseIdentifier:@"PlainCellIdentifier"];
//    if (_circleArray) {
//         [self.gridViewController setCircleArray:_circleArray];
//    }
//
    self.gridViewController.view.frame = CGRectMake(0.0, 0.0, 310.0, 500.0);
    [self.gridViewController.collectionView setBackgroundColor:[UIColor clearColor]];
    self.gridViewController.popupDismissProtocol = self.parentDelegate;
    self.gridViewController.selectCircleProtocol = self.parentDelegate;
    [self.view addSubview:_gridViewController.view];
    [self.view addSubview:_backButton];
    [_gridViewController.collectionView reloadData];
    CGPoint centerPoint =self.view.center;
    
    NSLog(@"center Y :%lf" ,self.view.center.y);
    _gridViewController.collectionView.center = centerPoint;
 //   NSLog(@"center Y grid :%lf" ,_gridViewController.gridView.center.y);
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
    [self.parentDelegate dismissPopup];

}

-(void) parseCirclesJSON
{
    _circleArray = [NSMutableArray arrayWithCapacity:10];
    NSString *result = CIRCLES;
    NSData *resultData = [result dataUsingEncoding: NSUTF8StringEncoding];
    NSDictionary *resultDict  = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableLeaves error:nil];
  //  NSLog(@"result :%@",[resultDict objectForKey:@"success"]);
    NSArray *circleDictArray = [resultDict objectForKey:@"circles"];
    for (NSDictionary *circleDict in circleDictArray)
    {
        //NSLog(@"circle %@",[circleDict objectForKey:@"circleName"]);
        NSString *circleName = [circleDict objectForKey:@"circleName"];
        [_circleArray addObject:circleName];
    }
    NSLog(@"array count %lu",_circleArray.count);
    
}
@end
