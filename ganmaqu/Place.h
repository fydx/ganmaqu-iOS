//
//  Place.h
//  ganmaqu
//
//  Created by LiBin on 14/11/15.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Place : NSObject

@property (nonatomic) double lat;
@property (nonatomic) double lng;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *type;
@property (strong,nonatomic) NSString *address;
@property (nonatomic) int cost;

- (id)initWithDictionary:(NSDictionary *)dict;
@end
