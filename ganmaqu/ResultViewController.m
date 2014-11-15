//
//  ResultViewController.m
//  ganmaqu
//
//  Created by LiBin on 14/11/15.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import "ResultViewController.h"
#import "AppUtility.h"
@implementation ResultViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.navigationController.navigationBar.hidden = NO;
    [self parseJSON];
    
    
}

- (void)parseJSON
{
    NSString *result = ROUTE;
    NSData *resultData = [result dataUsingEncoding: NSUTF8StringEncoding];
    NSDictionary *resultDict  = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableLeaves error:nil];
    NSDictionary *placeResult = resultDict[@"data"];
   // NSLog(@"data %@",placeResult);
    //NSData *placeData = [placeResult dataUsingEncoding: NSUTF8StringEncoding];
//    NSDictionary *placeDict = [NSJSONSerialization JSONObjectWithData:placeData options:NSJSONReadingMutableLeaves error:nil];
       NSArray *placeDictArray = [placeResult objectForKey:@"places"];
    for (NSDictionary *singleplaceDict in placeDictArray)
    {
        //NSLog(@"circle %@",[circleDict objectForKey:@"circleName"]);
        NSString *placeName = [singleplaceDict objectForKey:@"name"];
        NSLog(@"place name %@",placeName);
    }

}
@end
