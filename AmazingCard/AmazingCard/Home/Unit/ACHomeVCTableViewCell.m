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

@end
