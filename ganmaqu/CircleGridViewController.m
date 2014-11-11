//
//  CircleGridViewController.m
//  ganmaqu
//
//  Created by LiBin on 14/11/5.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import "CircleGridViewController.h"
#import "CircleGridViewCell.h"

@interface CircleGridViewController ()
@property (strong,nonatomic) NSMutableArray *circleArray;

@end
@implementation CircleGridViewController

-(CircleGridViewController *)initWithCircle : (NSMutableArray *)circleArray
{
    self = [super init];
    self.circleArray = circleArray;
    return self;
}
//- (void)setCircleArray:(NSMutableArray *)transcircleArray
//{
//    self.circleArray = transcircleArray;
//}
- (NSUInteger) numberOfItemsInGridView: (AQGridView *) aGridView
{
    return _circleArray.count;
}

- (AQGridViewCell *)gridView:(AQGridView *)gridView cellForItemAtIndex:(NSUInteger)index
{
    static NSString * PlainCellIdentifier = @"PlainCellIdentifier";
    CircleGridViewCell *cell = (CircleGridViewCell *)[self.gridView dequeueReusableCellWithIdentifier:PlainCellIdentifier];
    if (cell == nil) {
        cell = [[CircleGridViewCell alloc]initWithFrame:CGRectMake(0.0, 0.0, 50.0, 20.0) reuseIdentifier:PlainCellIdentifier];
        cell.selectionGlowColor = [UIColor grayColor];
        cell.circleNameLabel.text = [_circleArray objectAtIndex:index];
    }
    NSLog(@"init cell");
    return  cell;
}

- (CGSize) portraitGridCellSizeForGridView: (AQGridView *) aGridView
{
    return ( CGSizeMake(50.0, 20.0) );
}

- (void)viewDidLoad
{
    NSLog(@"123132");
}
@end
