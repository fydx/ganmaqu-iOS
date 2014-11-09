//
//  AppUtility.h
//  ganmaqu
//
//  Created by LiBin on 14/10/30.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#ifndef ganmaqu_AppUtility_h
#define ganmaqu_AppUtility_h
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define IPADDRESS @"http://192.168.1.102:8080"

#define CITIES @"{\"success\": true,\"cities\" :[{\"cityId\": 1, \"cityName\" : \"西安市\"},{\"cityId\": 2,\"cityName\" : \"北京市\"}]}"
#define CIRCLES @"{ \"success\": true, \"circles\" : [ { \"circleId\": 1, \"circleName\" : \"钟楼\" }, { \"circleId\": 2, \"circleName\" : \"小寨\" } ] }"
#endif

