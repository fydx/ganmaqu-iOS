//
//  Place.h
//  ganmaqu
//
//  Created by LiBin on 14/11/15.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Place : NSObject

@property (assign,nonatomic) CGFloat    lat;
@property (assign,nonatomic) CGFloat    lng;
@property (strong,nonatomic) NSString   *name;
@property (strong,nonatomic) NSString   *type;
@property (strong,nonatomic) NSString   *address;
@property (assign,nonatomic) NSUInteger cost;
@property (assign,nonatomic) NSUInteger rate;
@property (strong,nonatomic) NSString   *time;
@property (assign,nonatomic) NSUInteger weight;

- (id)initWithDictionary:(NSDictionary *)dict;
@end
