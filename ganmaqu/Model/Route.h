//
//  Route.h
//  ganmaqu
//
//  Created by LiBin on 15/6/10.
//  Copyright (c) 2015年 LiBin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Route : NSManagedObject

@property (nonatomic, retain) NSString * circle;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * routeData;
@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) NSString * type;

@end
