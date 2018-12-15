//
//  ACImageVIewContainer.m
//  AmazingCard
//
//  Created by 杨琦 on 2018/12/14.
//  Copyright © 2018 A.C. All rights reserved.
//

#import "ACImageVIewContainer.h"

@interface ACImageVIewContainer()

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImageView *resultImageView;
@end

@implementation ACImageVIewContainer

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = image;
        [self invalidate];
    }
    return self;
}

- (void)invalidate {
    
    self.resultImageView = [[UIImageView alloc] init];
    self.resultImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.resultImageView.userInteractionEnabled = YES;
    self.resultImageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height/2);
    [self addSubview:self.resultImageView];

    self.imageView = [[UIImageView alloc] initWithImage:self.image];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.userInteractionEnabled = YES;
    [self addSubview:self.imageView];
    self.imageView.frame = self.bounds;
    
    self.coverImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ACCover"]];
    self.coverImageView.contentMode = UIViewContentModeScaleToFill;
    self.coverImageView.userInteractionEnabled = YES;
    [self addSubview:self.coverImageView];
    self.coverImageView.frame = self.bounds;
}

- (void)clip {
    UIImage *image = [self imageFromView:self atFrame:self.bounds];
    self.resultImageView.image = image;
    
    [self.imageView removeFromSuperview];
    [self.coverImageView removeFromSuperview];
}

- (UIImage *)getImageInBrushByRect:(CGRect)rect {
    return [self imageFromView:self atFrame:rect];
}

//获得某个范围内的屏幕图像
- (UIImage *)imageFromView:(UIView *)theView atFrame:(CGRect)r
{
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [theView.layer renderInContext:context];
    //UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 3.取得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGImageRef subimageRef = CGImageCreateWithImageInRect(image.CGImage, r);
    UIImage *subImage = [UIImage imageWithCGImage:subimageRef];
    UIGraphicsEndImageContext();
    
    return  subImage;
}

@end
