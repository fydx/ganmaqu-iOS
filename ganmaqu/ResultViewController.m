//
//  ResultViewController.m
//  ganmaqu
//
//  Created by LiBin on 14/11/15.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import "ResultViewController.h"
#import "ResultViewCell.h"
#import "AppUtility.h"
#import "Place.h"
@interface ResultViewController()
@property (strong,nonatomic) NSMutableArray *placeArray;

@end

@implementation ResultViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.hidden = NO;
     self.title =@"推荐路线";
    [self parseRouteJSON];
    [self.tableView registerClass:[ResultViewCell class] forCellReuseIdentifier:@"CustomCell"];
    //self.tableView.layer.cornerRadius = 10.0;
    //self.tableView.layer.masksToBounds = YES;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:UIColorFromRGB(RESULTBGCOLOR)];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;

}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCell";
    ResultViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   // ResultViewCell  *cell = [[ResultViewCell alloc]initWithPlaceAndStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier place:[_placeArray objectAtIndex:indexPath.row] number:indexPath.row];
     if (cell == nil) {
    cell = [[ResultViewCell alloc]initWithPlaceAndStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier place:[_placeArray objectAtIndex:indexPath.row] number:indexPath.row];
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else
    {
        [cell setViews:[_placeArray objectAtIndex:indexPath.row] number:indexPath.row+1];
    }

    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];

    return cell;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 114;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _placeArray.count;
}

- (void)parseRouteJSON
{
    NSString *result = ROUTE;
    NSData *resultData = [result dataUsingEncoding: NSUTF8StringEncoding];
    NSDictionary *resultDict  = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableLeaves error:nil];
    NSDictionary *placeResult = resultDict[@"data"];
    _placeArray = [[NSMutableArray alloc]init];
   // NSLog(@"data %@",placeResult);
    //NSData *placeData = [placeResult dataUsingEncoding: NSUTF8StringEncoding];
//    NSDictionary *placeDict = [NSJSONSerialization JSONObjectWithData:placeData options:NSJSONReadingMutableLeaves error:nil];
       NSArray *placeDictArray = [placeResult objectForKey:@"places"];
    for (NSDictionary *singlePlaceDict in placeDictArray)
    {
        //NSLog(@"circle %@",[circleDict objectForKey:@"circleName"]);
        Place *singlePlace = [[Place alloc]init];
        singlePlace.name = [singlePlaceDict objectForKey:@"name"];
        singlePlace.address = [singlePlaceDict objectForKey:@"address"];
        singlePlace.lat = [singlePlaceDict objectForKey:@"lat"];
        singlePlace.lng = [singlePlaceDict objectForKey:@"lng"];
        singlePlace.cost = [singlePlaceDict objectForKey:@"cost"];
        singlePlace.type = [singlePlaceDict objectForKey:@"type"];
        [_placeArray addObject:singlePlace];
    }

}
@end
