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
#define RESULTBGCOLOR  0xebebeb
#define RESULTTEXTCOLOR 0x504e4e
#define CITIES @"{\"success\": true,\"cities\" :[{\"cityId\": 1, \"cityName\" : \"西安市\"},{\"cityId\": 2,\"cityName\" : \"北京市\"}]}"
#define CIRCLES @"{ \"success\": true, \"circles\" : [ { \"circleId\": 1, \"circleName\" : \"钟楼\" }, { \"circleId\": 2, \"circleName\" : \"小寨1\" } , { \"circleId\": 2, \"circleName\" : \"小寨2\" }, { \"circleId\": 2, \"circleName\" : \"小寨3\" }, { \"circleId\": 2, \"circleName\" : \"小寨4\" }, { \"circleId\": 2, \"circleName\" : \"小寨5\" }, { \"circleId\": 2, \"circleName\" : \"小寨6\" }, { \"circleId\": 2, \"circleName\" : \"小寨7\" }, { \"circleId\": 2, \"circleName\" : \"小寨8\" }, { \"circleId\": 2, \"circleName\" : \"小寨9\" }] }"

#define ROUTE @"{ \"success\" : true, \"data\" : { \"count\" : 5, \"cost\" : 80, \"places\" : [ { \"lat\" : \"37.0000\", \"lng\" : \"118.000000\", \"name\" : \"彼德西餐厅1\", \"type\" : \"西餐\", \"address\" : \"西安市未央区大明宫万达广场1\", \"cost\" : 72 },{ \"lat\" : \"37.0000\", \"lng\" : \"118.000000\", \"name\" : \"彼德西餐厅2\", \"type\" : \"西餐\", \"address\" : \"西安市未央区大明宫万达广场2\", \"cost\" : 72 },{ \"lat\" : \"37.0000\", \"lng\" : \"118.000000\", \"name\" : \"彼德西餐厅3\", \"type\" : \"西餐\", \"address\" : \"西安市未央区大明宫万达广场3\", \"cost\" : 72 },{ \"lat\" : \"37.0000\", \"lng\" : \"118.000000\", \"name\" : \"彼德西餐厅4\", \"type\" : \"西餐\", \"address\" : \"西安市未央区大明宫万达广场4\", \"cost\" : 72 },{ \"lat\" : \"37.0000\", \"lng\" : \"118.000000\", \"name\" : \"彼德西餐厅5\", \"type\" : \"西餐\", \"address\" : \"西安市未央区大明宫万达广场5\", \"cost\" : 73 } ] } }";
#endif

