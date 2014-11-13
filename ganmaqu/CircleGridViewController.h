//
//  CircleGridViewController.h
//  ganmaqu
//
//  Created by LiBin on 14/11/5.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AQGridViewController.h"
#import "SelectCircleProtocol.h"
#import "PopUpDismissProtocol.h"

@interface CircleGridViewController : UICollectionViewController

@property (strong,nonatomic) id<SelectCircleProtocol> selectCircleProtocol;
@property (strong,nonatomic) id<PopUpDismissProtocol> popupDismissProtocol;
//- (void)setCircleArray:(NSMutableArray *)transcircleArray;

-(CircleGridViewController *)initWithCollectionViewLayoutAndCircle:(UICollectionViewLayout *)layout circle:(NSMutableArray *)circleArray;
@end
