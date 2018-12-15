//
//  ACEditViewController+Brush.m
//  AmazingCard
//
//  Created by 杨琦 on 2018/12/11.
//  Copyright © 2018 A.C. All rights reserved.
//

#import "ACEditViewController+Brush.h"

@implementation ACEditViewController (Brush)

- (void)brush {
    
    UIImage *amazingCardImage = [UIImage imageNamed:@"amazingCard"];
    CGSize imageSize = amazingCardImage.size;
    CGSize viewSize = self.view.bounds.size;
//    CGFloat scale = viewSize.width / imageSize.width * imageSize.height < viewSize.height ? viewSize.width / imageSize.width : viewSize.height / imageSize.height;
    
    self.imageViewMiddle = [[UIImageView alloc] initWithImage:amazingCardImage];
    self.imageViewMiddle.contentMode = UIViewContentModeScaleAspectFit;
    self.imageViewMiddle.userInteractionEnabled = YES;
    self.imageViewMiddle.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.imageViewMiddle];
    self.imageViewMiddle.frame = self.view.bounds;
    
    CGFloat s = scale(self.view, self.imageViewMiddle);
    CGFloat width = self.view.frame.size.width / s;
    CGFloat height = self.view.frame.size.height / s;
    CGRect backImageViewFrame = CGRectMake(0, 0, width, height);
    self.backImageView = [[ACImageVIewContainer alloc] initWithFrame:backImageViewFrame image:amazingCardImage];
    [self.view insertSubview:self.backImageView atIndex:0];
    
    self.alphaView = [[UIView alloc] init];
    self.alphaView.backgroundColor = ColorWithAlpha(255, 230, 61, 0.4);
    [self.view addSubview:self.alphaView];
    CGFloat alphaViewWidth = self.view.bounds.size.width;
    CGFloat alphaViewHeight = alphaViewWidth * imageSize.height/imageSize.width;
    CGFloat alphaViewY = (viewSize.height - alphaViewHeight) / 2.0;
    self.alphaView.frame = CGRectMake(0, alphaViewY, alphaViewWidth, alphaViewHeight);
    
    self.imageViewTop = [[UIImageView alloc] initWithImage:amazingCardImage];
    self.imageViewTop.contentMode = UIViewContentModeScaleAspectFit;
    self.imageViewTop.userInteractionEnabled = YES;
    [self.view addSubview:self.imageViewTop];
    self.imageViewTop.frame = self.view.bounds;

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(brushPan:)];
    [self.imageViewTop addGestureRecognizer:pan];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(brushTap:)];
    [self.imageViewTop addGestureRecognizer:tap];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                           target:self
                                                                                           action:@selector(rightBarButtonItem:)];
}

- (void)rightBarButtonItem:(UIBarButtonItem *)item {
//    [self.backImageView clip];
//    [self.backImageView removeFromSuperview];
//    [self.view addSubview:self.backImageView];
    /*
     CGFloat imageCurWidth = self.view.bounds.size.width;
     CGFloat imageCurHeight = imageCurWidth * (self.imageView.image.size.height / self.imageView.image.size.width);
     
     CGFloat curClipY = clipViewframe.origin.y - (self.view.bounds.size.height - imageCurHeight) / 2.0;
     CGFloat curClipX = clipViewframe.origin.x;
     
     CGFloat s = scale(self.view, self.imageView);
     CGFloat clipY = curClipY / s;
     CGFloat clipX = curClipX / s;
     CGFloat clipW = clipViewframe.size.width / s;
     CGFloat clipH = clipViewframe.size.height / s;
     CGRect clipFrame = CGRectMake(clipX, clipY, clipW, clipH);
     */
//    CGFloat imageCurWidth = self.view.bounds.size.width;
//    CGFloat imageCurHeight = imageCurWidth * (self.imageView.image.size.height / self.imageView.image.size.width);
//
//    CGFloat topLeftCornerY = self.topLeftCorner.y - (self.view.bounds.size.height - imageCurHeight) / 2.0;
    
    
    CGFloat width = self.bottomrigntCorner.x - self.topLeftCorner.x;
    CGFloat height = self.bottomrigntCorner.y - self.topLeftCorner.y;
    CGFloat s = scale(self.view, self.imageViewMiddle);
    CGFloat backImageViewX = self.topLeftCorner.x / s;
    CGFloat backImageViewY = self.topLeftCorner.y / s;
    CGFloat backImageViewW = width / s;
    CGFloat backImageViewH = height / s;
    CGRect backImageViewFrame = CGRectMake(backImageViewX, backImageViewY, backImageViewW, backImageViewH);
    UIImage *image = [self.backImageView getImageInBrushByRect:backImageViewFrame];
    ACResultViewController *resultVC = [[ACResultViewController alloc] initWithImage:image];
    [self.navigationController pushViewController:resultVC animated:YES];
}

- (void)brushTap:(UIGestureRecognizer *)tap {
    CGPoint p = [tap locationInView:self.imageView];
    [self drawLineWithPoint:p];
}

- (void)brushPan:(UIPanGestureRecognizer *)pan {
    
    // 获取当前触摸点
    CGPoint curP = [pan locationInView:self.view];
    
    // 获取擦除的矩形范围
    CGFloat wh = 20;
    CGFloat x = curP.x - wh * 0.5;
    CGFloat y = curP.y - wh * 0.5;
    CGRect rect = CGRectMake(x, y, wh, wh);
    
    if (CGPointEqualToPoint(self.topLeftCorner, CGPointZero) || CGPointEqualToPoint(self.bottomrigntCorner, CGPointZero)) {
        self.topLeftCorner = CGPointMake(x, y);
        self.bottomrigntCorner = CGPointMake(x+wh, y+wh);
    } else {
        CGFloat topLeftCornerX = self.topLeftCorner.x < x ? self.topLeftCorner.x : x;
        CGFloat topLeftCornerY = self.topLeftCorner.y < y ? self.topLeftCorner.y : y;
        CGFloat bottomRightCornerX = self.bottomrigntCorner.x > x+wh ? self.bottomrigntCorner.x : x+wh;
        CGFloat bottomRightCornerY = self.bottomrigntCorner.y > y+wh ? self.bottomrigntCorner.y : y+wh;
        self.topLeftCorner = CGPointMake(topLeftCornerX, topLeftCornerY);
        self.bottomrigntCorner = CGPointMake(bottomRightCornerX, bottomRightCornerY);
    }
    
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 渲染控件
    [self.imageViewTop.layer renderInContext:ctx];
    // 擦除上下文的某一部分
    CGContextClearRect(ctx, rect);
    // 生成一张图片
    UIImage *topImage = UIGraphicsGetImageFromCurrentImageContext();
    self.imageViewTop.image = topImage;
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(self.backImageView.bounds.size, NO, 0);
    // 获取当前上下文
    CGContextRef ctx2 = UIGraphicsGetCurrentContext();
    
    CGFloat s = scale(self.view, self.imageViewMiddle);
    CGFloat backImageViewX = rect.origin.x / s;
    CGFloat backImageViewY = rect.origin.y / s;
    CGFloat backImageViewW = rect.size.width / s;
    CGFloat backImageViewH = rect.size.height / s;
    CGRect backImageViewFrame = CGRectMake(backImageViewX, backImageViewY, backImageViewW, backImageViewH);
    // 渲染控件
    [self.backImageView.coverImageView.layer renderInContext:ctx2];
    // 擦除上下文的某一部分
    CGContextClearRect(ctx2, backImageViewFrame);
    // 生成一张图片
    UIImage *coverImage = UIGraphicsGetImageFromCurrentImageContext();
    self.backImageView.coverImageView.image = coverImage;
    // 关闭上下文
    UIGraphicsEndImageContext();
}

- (void)drawLineWithPoint:(CGPoint)p {
    
}

@end
