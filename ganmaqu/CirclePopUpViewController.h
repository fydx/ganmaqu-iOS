//
//  CirclePopUpViewController.m
//  ganmaqu
//
//  Created by LiBin on 14/11/5.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import "UIViewController+CWPopup.h"
#import "PopUpDismissProtocol.h"
@interface CirclePopUpViewController : UIViewController

@property (strong,nonatomic) id<PopUpDismissProtocol> popUpDismissDelegate;
@end
