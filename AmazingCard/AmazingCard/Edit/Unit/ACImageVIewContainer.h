//
//  ACImageVIewContainer.h
//  AmazingCard
//
//  Created by 杨琦 on 2018/12/14.
//  Copyright © 2018 A.C. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACImageVIewContainer : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *coverImageView;

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image;
- (UIImage *)getImageInBrushByRect:(CGRect)rect;
- (void)clip;

@end
