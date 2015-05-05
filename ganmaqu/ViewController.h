//
//  ViewController.h
//  ganmaqu
//
//  Created by LiBin on 14/10/27.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import "UIViewController+CWPopup.h"
#import "PopUpDismissProtocol.h"
#import "SelectCircleProtocol.h"
#import <BaiduMapAPI/BMKLocationService.h>

@interface ViewController : UIViewController<PopUpDismissProtocol,SelectCircleProtocol,BMKLocationServiceDelegate>


@end

