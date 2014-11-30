//
//  Place.h
//  ganmaqu
//
//  Created by LiBin on 14/11/15.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Place : NSObject

@property (strong,nonatomic) NSNumber *lat;
@property (strong,nonatomic) NSNumber *lng;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *type;
@property (strong,nonatomic) NSString *address;
@property (strong,nonatomic) NSNumber *cost;

- (id)initWithDictionary:(NSDictionary *)dict;
@end
