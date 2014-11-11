//
//  CircleGridViewController.h
//  ganmaqu
//
//  Created by LiBin on 14/11/5.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AQGridViewController.h"
@interface CircleGridViewController : AQGridViewController

//- (void)setCircleArray:(NSMutableArray *)transcircleArray;
-(CircleGridViewController *)initWithCircle : (NSMutableArray *)circleArray;
@end
