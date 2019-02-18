//
//  ACHomeVCTableViewCell.m
//  AmazingCard
//
//  Created by 杨琦 on 2018/12/5.
//  Copyright © 2018 AmazingCard. All rights reserved.
//

#import "ACHomeVCTableViewCell.h"
#import "Masonry.h"

@interface ACHomeVCTableViewCell()
    
@property (nonatomic, strong) UIView *containterShadow;
@property (nonatomic, strong) UIView *containter;
@property (nonatomic, strong) UIImageView *mainImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIVisualEffectView *effectView;

@end

@implementation ACHomeVCTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self invalidate];
    }
    return self;
}

- (void)invalidate {
    
    [self setUpSubView];
    [self layoutSubView];
    [self setupEvents];
}

- (void)setUpSubView {
    
    self.backgroundColor = [UIColor clearColor];
    
    _containterShadow = [[UIView alloc] init];
    _containterShadow.backgroundColor = [UIColor clearColor];
    _containterShadow.layer.shadowColor = [UIColor blackColor].CGColor;
    _containterShadow.layer.shadowOpacity = 0.1;
    _containterShadow.layer.shadowRadius = scaleForiPadAndBaseOn6p(10, 6);
    _containterShadow.layer.shadowOffset = CGSizeMake(1, 1);
    [self.contentView addSubview:_containterShadow];
    
    _containter = [[UIView alloc] init];
    _containter.backgroundColor = GRAYCOLOR(255);
    _containter.layer.cornerRadius = scaleForiPadAndBaseOn6p(11, 12);
    _containter.layer.masksToBounds = YES;
    [_containterShadow addSubview:_containter];
    
    _mainImageView = [[UIImageView alloc] init];
    _mainImageView.contentMode = UIViewContentModeScaleAspectFill;
    [_containter addSubview:_mainImageView];
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    _effectView =[[UIVisualEffectView alloc] initWithEffect:blurEffect];
    [_mainImageView addSubview:_effectView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.numberOfLines = 0;
    [_mainImageView addSubview:_titleLabel];
    _titleLabel.text = @"Get outta here, you little brat!\n\n滚！你们这些小畜生";
}

- (void)layoutSubView {
    
    [_containterShadow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(scaleForiPadAndBaseOn6p(21, 16));
        make.left.equalTo(self.contentView).offset(scaleForiPadAndBaseOn6p(35, 9));
        make.right.equalTo(self.contentView).offset(-scaleForiPadAndBaseOn6p(35, 9));
        make.bottom.equalTo(self.contentView);
    }];
    
    [_containter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_containterShadow);
    }];
    
    [_mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_containter);
    }];
    
    [_effectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_mainImageView);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(_mainImageView).offset(20);
        make.bottom.right.equalTo(_mainImageView).offset(-20);
    }];
}

- (void)setupEvents {
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(containterTapAction:)];
    [_containter addGestureRecognizer:tap];
}

- (void)containterTapAction:(UITapGestureRecognizer *)tap {
    if (self.containterTapAction) {
        self.containterTapAction();
    }
}

- (void)setMainImage:(UIImage *)mainImage {
    _mainImageView.image = mainImage;
}


@end
