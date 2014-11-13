//
//  CircleGridViewController.m
//  ganmaqu
//
//  Created by LiBin on 14/11/5.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import "CircleGridViewController.h"
#import "CircleGridViewCell.h"
#define NUMBER_OF_LINE 3
@interface CircleGridViewController ()
@property (strong,nonatomic) NSMutableArray *circleArray;
@property int sectionNumber;
@property int rowNumber;

@end
@implementation CircleGridViewController


- (instancetype)initWithCollectionViewLayoutAndCircle:(UICollectionViewLayout *)layout circle:(NSMutableArray *)circleArray
{
    self = [super initWithCollectionViewLayout:layout];
    _circleArray = circleArray;
    _sectionNumber = NUMBER_OF_LINE;
    _rowNumber = (int)(_circleArray.count/_sectionNumber) + 1;
    return self;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"section %lu, rowNumber %d",section,_rowNumber);
    if (section < _rowNumber - 1 ) {
        return _sectionNumber;
    }
    else
    {
        return _circleArray.count - _sectionNumber * ( _rowNumber - 1 );
    }
   
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSLog(@"rownumber %d",_rowNumber);
    return _rowNumber;
}


-(CircleGridViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexpath: section: %lu, item %lu",indexPath.section,indexPath.item);
    static NSString * PlainCellIdentifier = @"PlainCellIdentifier";
    CircleGridViewCell *cell = (CircleGridViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:PlainCellIdentifier forIndexPath:indexPath];
        cell.contentView.backgroundColor = [UIColor grayColor];
              //cell.circleButton.titleLabel.text = [_circleArray objectAtIndex:index];
        [cell.circleButton setTitle:[_circleArray objectAtIndex:(indexPath.item)+(indexPath.section * _sectionNumber)] forState:UIControlStateNormal];
    [cell.circleButton addTarget:self action:@selector(circleClickEvent:event:) forControlEvents:UIControlEventTouchUpInside];
    NSLog(@"init cell %lu",indexPath.item);
    return  cell;
}
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(85, 30);
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CircleGridViewCell * cell = (CircleGridViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    NSLog(@"select");
}

@end
