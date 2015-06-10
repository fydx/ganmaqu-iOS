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
#pragma mark - NSCoding
- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.lat = [decoder decodeDoubleForKey:@"lat"];
    self.lng = [decoder decodeDoubleForKey:@"lng"];;
    self.name = [decoder decodeObjectForKey:@"name"];
    self.type = [decoder decodeObjectForKey:@"type"];
    self.address = [decoder decodeObjectForKey:@"address"];
    self.time = [decoder decodeObjectForKey:@"time"];
    self.shopId = [decoder decodeObjectForKey:@"shopId"];
    self.detailType = [decoder decodeObjectForKey:@"detailType"];
    self.cost = [decoder decodeIntegerForKey:@"cost"];
    self.rate = [decoder decodeIntegerForKey:@"rate"];
 
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeDouble:self.lat forKey:@"lat"];
    [encoder encodeDouble:self.lng forKey:@"lng"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.type forKey:@"type"];
    [encoder encodeObject:self.address forKey:@"address"];
    [encoder encodeObject:self.time forKey:@"time"];
    [encoder encodeObject:self.shopId forKey:@"shopId"];
    [encoder encodeObject:self.detailType forKey:@"detailType"];
    [encoder encodeInteger:self.cost forKey:@"cost"];
    [encoder encodeInteger:self.rate forKey:@"rate"];
    
}
@end
