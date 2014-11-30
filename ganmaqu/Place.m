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
        self.lat = dict[@"lat"];
        self.lng = dict[@"lng"];
        self.name = dict[@"name"];
        self.type = dict[@"name"];
        self.address = dict[@"address"];
        self.cost = dict[@"cost"];
        
        
    }
    return self;
}
@end
