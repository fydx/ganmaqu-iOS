//
//  AppDelegate.h
//  ganmaqu
//
//  Created by LiBin on 14/10/27.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <BaiduMapAPI/BMapKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,BMKGeneralDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) NSManagedObjectContext       *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel         *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic)  BMKMapManager  *mapManager;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;



@end

