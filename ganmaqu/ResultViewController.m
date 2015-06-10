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
#import "JSONKit.h"
#import "Place.h"
#import "AFNetWorking.h"
#import "MapViewController.h"
#import "DetailViewController.h"
#import "SaveSuccessViewController.h"
#import "AppDelegate.h"
#import "Route.h"
@interface ResultViewController()



@end

@implementation ResultViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.hidden = NO;
     self.title =@"推荐路线";
    //self.tableView.editing = YES;
    [self.tableView registerClass:[ResultViewCell class] forCellReuseIdentifier:@"CustomCell"];
    //self.tableView.layer.cornerRadius = 10.0;
    //self.tableView.layer.masksToBounds = YES;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:UIColorFromRGB(RESULTBGCOLOR)];
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveRoute)];
    UIBarButtonItem *mapButton = [[UIBarButtonItem alloc]initWithTitle:@"Map" style:UIBarButtonItemStyleDone target:self action:@selector(enterMapViewController)];
    NSArray *barItemArray = [[NSArray alloc]initWithObjects:saveButton,mapButton,nil];
    self.navigationItem.rightBarButtonItems = barItemArray;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    DetailViewController *detailViewController = (DetailViewController*)[storyboard instantiateViewControllerWithIdentifier:@"detailController"];
    NSMutableString *url = [[NSMutableString alloc]initWithString:@"http://m.dianping.com/shop/"];
    Place *place = [self.places objectAtIndex:indexPath.row];
    [url appendString:place.shopId];
    detailViewController.url = [url copy];
    [self.navigationController pushViewController:detailViewController animated:YES];

}
-(void)saveRoute
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *requestURL = [IPADDRESS stringByAppendingString:@"/?command=arrive"];
    for (Place *place in self.places)
    {
        NSDictionary *parameters = @{@"shopId": place.shopId,@"user":DEFALUT_USER};
        [manager GET:requestURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"send arrived : %@",place.name);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"send arrived error");
        }];
    }
    //使用Core Data进行存储
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *managedContext = [appDelegate managedObjectContext];
    if (managedContext != nil) {
        Route *route = [NSEntityDescription insertNewObjectForEntityForName:@"Route" inManagedObjectContext:managedContext];
        route.circle = self.circleName;
        route.type  = self.type;
        route.city = self.city;
        route.time  = [NSDate date];
        route.routeData = [NSKeyedArchiver archivedDataWithRootObject:self.places];
    }
    [appDelegate saveContext];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    SaveSuccessViewController *saveSuccessViewController = (SaveSuccessViewController *)[storyboard instantiateViewControllerWithIdentifier:@"saveSuccessController"];
    [self.navigationController pushViewController:saveSuccessViewController animated:YES];

}
-(void)enterMapViewController
{
    MapViewController *mapViewController = [[MapViewController alloc]init];
    mapViewController.places = self.places;
    [self.navigationController pushViewController:mapViewController animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;

}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
       // [dataArray removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source.
       // [testTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self requestChangePlace:[self.places objectAtIndex:indexPath.row] index:indexPath.row];
    }
   
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"更换";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCell";
    ResultViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   // ResultViewCell  *cell = [[ResultViewCell alloc]initWithPlaceAndStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier place:[_placeArray objectAtIndex:indexPath.row] number:indexPath.row];
     if (cell == nil) {
         cell = [[ResultViewCell alloc]initWithPlaceAndStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier place:[self.places objectAtIndex:indexPath.row] number:indexPath.row];
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else
    {
        [cell setViews:[self.places objectAtIndex:indexPath.row] number:indexPath.row+1];
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
    return self.places.count;
}

-(void)requestChangePlace: (Place *)place index:(NSUInteger)index
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *parameters = @{@"city": CITY,
                                 @"type":self.type,
                                 @"pos_x":self.circleLng,
                                 @"pos_y":self.circleLat,
                                 @"time":place.time,
                                 @"shopName":place.name,
                                 @"cost":[NSString stringWithFormat:@"%ld",place.cost],
                                @"weight":[NSString stringWithFormat:@"%ld",place.weight]};
    NSString *requestURL = [IPADDRESS stringByAppendingString:@"/?command=change"];
    __weak typeof(self) weakMe = self;
    [manager GET:requestURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        __strong typeof(self) strongMe = weakMe;
        NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        Place *changedPlace = [self parseJSONArrayToPlace:responseString];
        [strongMe.places replaceObjectAtIndex:index withObject:changedPlace];
        [strongMe.tableView reloadData];
        [strongMe sendDeletePlace:place];
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"requestChangePlace Error: %@", error);
    }];
}

-(Place *)parseJSONArrayToPlace :(NSString *)result
{
    NSData *resultData = [result dataUsingEncoding: NSUTF8StringEncoding];
    NSArray *jsonArray = [resultData objectFromJSONData];
    return [[Place alloc]initWithDictionary:[jsonArray firstObject]];
}

-(void)sendDeletePlace: (Place *)place
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *parameters = @{@"shopId":place.shopId,@"userId":DEFALUT_USER};
    NSString *requestURL = [IPADDRESS stringByAppendingString:@"/?command=delete"];
    [manager GET:requestURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"send delete : %@",place.name);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"send delete ERROR : %@",place.name);
    }];
}
@end
