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


@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *recommandButton;
@property (strong, nonatomic) IBOutlet UIButton *typeButton;
@property (strong, nonatomic) IBOutlet UIButton *confirmButton;
@property UIAlertView *alert;
@property UIAlertView *secondalert;
@property (strong, nonatomic) IBOutlet UIImageView *rightCloudImageView;
@property (strong, nonatomic) IBOutlet UIImageView *leftCloudImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.useBlurForPopup = YES;
    [self setWidget];
    
    
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
    popupViewController.popUpDismissDelegate = self;
    [self presentPopupViewController:popupViewController animated:YES completion:nil];
   }

- (void)dismissPopup
{
    [self dismissPopupViewControllerAnimated:YES completion:nil];
}
@end
