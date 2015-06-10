//
//  ResultViewController.h
//  ganmaqu
//
//  Created by LiBin on 14/11/15.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultViewController : UITableViewController
@property (strong,nonatomic) NSMutableArray *places;
@property (strong,nonatomic) NSString       *type;
@property (strong,nonatomic) NSString       *circleLat;
@property (strong,nonatomic) NSString       *circleLng;
@property (strong,nonatomic) NSString       *circleName;
@property (strong,nonatomic) NSString       *city;

@end
