//
//  ViewController.m
//  ganmaqu
//
//  Created by LiBin on 14/10/27.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import "ViewController.h"
#import "AppUtility.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *recommandButton;
@property (strong, nonatomic) IBOutlet UIButton *typeButton;

@property (strong, nonatomic) IBOutlet UIButton *confirmButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setWidget];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setWidget
{
    //设置推荐商圈按钮样式
//    CGRect recommandFrame ;
//    recommandFrame = self.recommandButton.frame;
//    recommandFrame.size.width = 1000.0;
//    self.recommandButton.frame = recommandFrame;
    //[self.recommandButton setBackgroundColor:[UIColor ]];
    _recommandButton.backgroundColor = UIColorFromRGB(0xffbb33);
    _recommandButton.layer.cornerRadius = 3.0;
    _typeButton.backgroundColor = UIColorFromRGB(0x99cc00);
    _typeButton.layer.cornerRadius = 3.0;
}
@end
