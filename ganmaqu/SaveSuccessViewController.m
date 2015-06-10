//
//  SaveSuccessViewController.m
//  ganmaqu
//
//  Created by LiBin on 15/6/10.
//  Copyright (c) 2015年 LiBin. All rights reserved.
//

#import "SaveSuccessViewController.h"

@interface SaveSuccessViewController ()
@property (strong, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation SaveSuccessViewController
- (IBAction)backToMainPage:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
