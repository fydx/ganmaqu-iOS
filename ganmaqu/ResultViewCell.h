//
//  ResultViewCell.h
//  ganmaqu
//
//  Created by LiBin on 14/11/15.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Place.h"
@interface ResultViewCell : UITableViewCell

- (instancetype)initWithPlaceAndStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier place:(Place *)place number:(NSInteger )number;
- (void)setViews:(Place *)place number:(NSInteger )number;
@end
