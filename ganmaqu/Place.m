//
//  Place.m
//  ganmaqu
//
//  Created by LiBin on 14/11/15.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import "Place.h"

@implementation Place
- (id)initWithDictionary:(NSDictionary *)dict;
{
    if (self = [super init]) {
        self.lat = [dict[@"pos_y"] floatValue];
        self.lng = [dict[@"pos_x"] floatValue];
        self.name = dict[@"shopName"];
        self.type = dict[@"mainType"];
        self.address = dict[@"address"];
        self.time = dict[@"time"];
        self.shopId = dict[@"id"];
        self.detailType = dict[@"detailType"];
        self.cost = [dict[@"cost"] unsignedIntegerValue];
        self.rate = [dict[@"rate"] unsignedIntegerValue];
    }
    return self;
}
@end
