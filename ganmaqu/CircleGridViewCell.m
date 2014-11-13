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
        self.circleButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 85, 30)];
        [self.circleButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
        [self.circleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.circleButton.titleLabel.text = @"123";
        self.circleButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [mainView addSubview:self.circleButton];
        
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
