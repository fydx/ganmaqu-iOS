//
//  CircleGridViewCell.m
//  ganmaqu
//
//  Created by LiBin on 14/11/9.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import "CircleGridViewCell.h"

@implementation CircleGridViewCell

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView* mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
        [mainView setBackgroundColor:[UIColor clearColor]];
        self.circleNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
        [self.circleNameLabel setFont:[UIFont systemFontOfSize:14]];
        self.circleNameLabel.text = @"123";
       
        [mainView addSubview:self.circleNameLabel];
        
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
