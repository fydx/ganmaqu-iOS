//
//  CircleGridViewCell.m
//  ganmaqu
//
//  Created by LiBin on 14/11/9.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import "CircleGridViewCell.h"

@implementation CircleGridViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView* mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 85, 30)];
        [mainView setBackgroundColor:[UIColor clearColor]];
        self.circleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 85, 30)];
        [self.circleLabel setFont:[UIFont systemFontOfSize:16]];
        [self.circleLabel setTextColor:[UIColor whiteColor]];

        self.circleLabel.textAlignment = NSTextAlignmentCenter;
        [mainView addSubview:self.circleLabel];
        
        [self.contentView addSubview:mainView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //CGRect frame = _circleNameLabel.frame;
    
}
@end
