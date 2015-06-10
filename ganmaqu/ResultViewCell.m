//
//  ResultViewCell.m
//  ganmaqu
//
//  Created by LiBin on 14/11/15.
//  Copyright (c) 2014年 LiBin. All rights reserved.
//

#import "ResultViewCell.h"
#import "Masonry.h"
#import "AppUtility.h"

@interface ResultViewCell()

@property (strong,nonatomic) UILabel *numberLabel;
@property (strong,nonatomic) UILabel *shopNameLabel;
@property (strong,nonatomic) UILabel *addressLabel;
@property (strong,nonatomic) UILabel *typeLabel;
@property (strong,nonatomic) UILabel *costLabel;
@property (strong,nonatomic) UIImageView *costImage;
@property (strong,nonatomic) UIImageView *typeImage;
@property (strong,nonatomic) UIView *upView;
@property (strong,nonatomic) UIView *downView;
@property (strong,nonatomic) UIView *shopInfoView;
@property (strong,nonatomic) UIView *mainView;
@property (strong,nonatomic) Place  *place;
@end

@implementation ResultViewCell



- (instancetype)initWithPlaceAndStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier place:(Place *)place number:(NSInteger )number;
{
    NSLog(@"cell init");
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        self.place = place;
        //self.contentView.layer.masksToBounds = YES;
        //self.contentView.layer.cornerRadius = 20.0;
        [self createView];
        [self setNumber:number];
        [self setMASLayout];
        [self setViewStyle];
        [self bindData:place];


    }
    return self;
}

- (void)setViews:(Place *)place number:(NSInteger )number
{
    if (!self.numberLabel) {
        [self createView];
        [self setNumber:number];
        //[self setLayout];
        [self setMASLayout];
        [self setViewStyle];
    }
     self.place = place;
    [self bindData:place];

}

- (void)bindData:(Place *)place
{
    _shopNameLabel.text = place.name;
    _addressLabel.text = place.address;
    _typeLabel.text = place.type;
    _costLabel.text = [NSString stringWithFormat:@"%ld",place.cost];
    [_costImage setImage:[UIImage imageNamed:@"resultpage_icon_cost"]];
    //[_typeImage setImage:[UIImage imageNamed:@"resultpage_icon_eat"]];
    [self buildImageStype];
   // _costLabel.backgroundColor = [UIColor blueColor];
}
- (void)buildImageStype
{
    if ([self.place.detailType isEqualToString:@"咖啡厅"]) {
        [_typeImage setImage:[UIImage imageNamed:@"resultpage_icon_coffee"]];
    }
    else if([self.place.detailType isEqualToString:@"KTV"])
    {
       [_typeImage setImage:[UIImage imageNamed:@"resultpage_icon_ktv"]];
    }
    else if([self.place.detailType isEqualToString:@"电影院"])
    {
       [_typeImage setImage:[UIImage imageNamed:@"resultpage_icon_movie"]];
    }
    else if([self.place.detailType isEqualToString:@"超市/便利店"])
    {
        [_typeImage setImage:[UIImage imageNamed:@"resultpage_icon_shop"]];
    }
    else if([self.place.type isEqualToString:@"美食"])
    {
        [_typeImage setImage:[UIImage imageNamed:@"resultpage_icon_eat"]];
    }
    else
    {
        [_typeImage setImage:[UIImage imageNamed:@"resultpage_icon_park"]];
    }
}
-(void)setViewStyle
{
    [_numberLabel setFont:[UIFont systemFontOfSize:62]];
    [_addressLabel setFont:[UIFont systemFontOfSize:13]];
    [_addressLabel setTextColor:UIColorFromRGB(RESULTTEXTCOLOR)];
    [_shopNameLabel setFont:[UIFont systemFontOfSize:28]];
    self.shopNameLabel.numberOfLines = 1;
    self.shopNameLabel.minimumScaleFactor = 0.8;
    self.shopNameLabel.adjustsFontSizeToFitWidth = YES;
    [_typeLabel setFont:[UIFont systemFontOfSize:15]];
    [_typeLabel setTextColor:UIColorFromRGB(RESULTTEXTCOLOR)];
    [_costLabel setFont:[UIFont systemFontOfSize:15]];
    [_costLabel setTextColor:UIColorFromRGB(RESULTTEXTCOLOR)];
    [_numberLabel setTextColor:[UIColor lightGrayColor]];
    [_upView setBackgroundColor:UIColorFromRGB(0xf2f2f2)];
    [self.contentView setBackgroundColor:UIColorFromRGB(RESULTBGCOLOR)];
    [_downView setBackgroundColor:UIColorFromRGB(0xffffff)];
    self.selectionStyle = UITableViewCellSelectionStyleNone;

}
- (void)setNumber:(NSInteger )number
{
    _numberLabel.text =  [NSString stringWithFormat:@"%ld",(long)number];
}
-(void)createView
{
    _numberLabel = [[UILabel alloc]init];
    _shopNameLabel = [[UILabel alloc]init];
    _typeLabel = [[UILabel alloc]init];
    _costLabel = [[UILabel alloc]init];
    _addressLabel = [[UILabel alloc]init];
    _costImage = [[UIImageView alloc]init];
    _typeImage = [[UIImageView alloc]init];
    _upView = [[UIView alloc]init];
    _downView = [[UIView alloc]init];
    _shopInfoView = [[UIView alloc]init];
//    _numberLabel.translatesAutoresizingMaskIntoConstraints = NO;
//    _shopInfoView.translatesAutoresizingMaskIntoConstraints = NO;
//    _typeImage.translatesAutoresizingMaskIntoConstraints = NO;
//    _typeLabel.translatesAutoresizingMaskIntoConstraints = NO;
//    _costImage.translatesAutoresizingMaskIntoConstraints= NO;
//    _costLabel.translatesAutoresizingMaskIntoConstraints = NO;
//    _addressLabel.translatesAutoresizingMaskIntoConstraints =NO;
//    _upView.translatesAutoresizingMaskIntoConstraints = NO;
//    _downView.translatesAutoresizingMaskIntoConstraints = NO;
//    _shopNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_shopInfoView addSubview:_shopNameLabel];
    [_shopInfoView addSubview:_addressLabel];
    [_upView addSubview:_numberLabel];
    [_upView addSubview:_shopInfoView];
    [_upView addSubview:_typeImage];
    [_downView addSubview:_typeLabel];
    [_downView addSubview:_costImage];
    [_downView addSubview:_costLabel];
//     _mainView = [[UIView alloc]init];
  //[self.contentView addSubview:_upView];
    //[self.contentView addSubview:_downView];
//    _mainView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_upView];
    [self.contentView addSubview:_downView];
//    [self.contentView addSubview:_mainView];
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_upView.bounds byRoundingCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(10, 10)];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = _upView.bounds;
//    maskLayer.path = maskPath.CGPath;
//    _upView.layer.mask = maskLayer;
    
}
-(void)setLayout
{
    NSString *mainVFL = @"V:|-20-[_upView(50)]-10-[_downView]-20-|";
    NSString *shopInfoVFL = @"V:|-30-[_shopNameLabel]-5-[_addressLabel]-|";
    NSString *upVFL = @"H:|-7-[_numberLabel]-3-[_shopInfoView]-10-[_typeImage]-7-|";
    NSString *downVFL = @"H:|-50-[_typeLabel]-5-[_costImage]-[_costLabel]-20-|";
    NSDictionary *mainDict = NSDictionaryOfVariableBindings(_upView,_downView);
    NSDictionary *shopInfoDict = NSDictionaryOfVariableBindings(_shopNameLabel,_addressLabel);
    NSDictionary *upDict = NSDictionaryOfVariableBindings(_numberLabel,_shopInfoView,_typeImage);
    NSDictionary *downDict = NSDictionaryOfVariableBindings(_typeLabel,_costImage,_costLabel);
    [_shopInfoView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:shopInfoVFL options:0 metrics:nil views:shopInfoDict]];
    [_upView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:upVFL options:0 metrics:nil views:upDict]];
    [_downView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:downVFL options:0 metrics:nil views:downDict]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:mainVFL options:0 metrics:nil views:mainDict]];
}

-(void)setMASLayout
{
    int padding = 10;
    int leftPadding = 20;
    [_upView mas_makeConstraints:^(MASConstraintMaker *make)
    {
      make.top.equalTo(self.contentView).offset(padding);
      make.left.equalTo(self.contentView).offset(padding);
      //make.bottom.equalTo(_downView.mas_top);
      make.right.equalTo(self.contentView).offset(-padding);
      //make.height.lessThanOrEqualTo(@70);
    }
    ];
    [_downView mas_makeConstraints:^(MASConstraintMaker *make)
    {
      make.top.equalTo(_upView.mas_bottom);
      make.left.equalTo(_upView.mas_left);
      make.right.equalTo(_upView.mas_right);
      make.bottom.equalTo(self.contentView.mas_bottom);

    }];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make)
    {
       make.top.equalTo(_upView);
       make.left.equalTo(_upView).offset(padding);
       make.width.equalTo(@32);
       make.bottom.equalTo(_upView);
    }];

    [_shopInfoView mas_makeConstraints:^(MASConstraintMaker *make)
    {
      make.top.equalTo(_upView);
      make.left.equalTo(_numberLabel.mas_right).offset(padding);
      make.right.equalTo(_upView).offset(-16);
      make.bottom.equalTo(_upView);
    }
    ];
    [_shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make)
    {
      make.top.equalTo(_shopInfoView).offset(padding);
      make.left.equalTo(_shopInfoView);
      make.right.equalTo(_shopInfoView).offset(-16);
    }
    ];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make)
    {
      make.top.equalTo(_shopNameLabel.mas_bottom).offset(3);
      make.left.equalTo(_shopInfoView);

    }
    ];
    [_typeImage mas_makeConstraints:^(MASConstraintMaker *make)
    {
      make.top.equalTo(_upView);
      make.right.equalTo(_upView);
      make.width.equalTo(@46);
      make.height.equalTo(@46);
    }
    ];
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make)
    {
       make.top.equalTo(_downView).offset(3);
       make.left.equalTo(_downView).offset(padding+3);
    }
    ];
    [_costLabel mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.top.equalTo(_typeLabel);
        make.right.equalTo(_downView).offset(-leftPadding);
    }];
    [_costImage mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.top.equalTo(_costLabel).offset(2);
        make.right.equalTo(_costLabel.mas_left).offset(-5);
    }
    ];


}
@end
