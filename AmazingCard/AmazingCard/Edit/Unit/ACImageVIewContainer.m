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
@property (nonatomic, assign) CGFloat scale;
@property (nonatomic, assign) CGPoint topLeftCorner;
@property (nonatomic, assign) CGPoint bottomrigntCorner;
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

    self.coverImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ACCover"]];
    self.coverImageView.contentMode = UIViewContentModeScaleToFill;
    self.coverImageView.userInteractionEnabled = YES;
    [self addSubview:self.coverImageView];
    self.coverImageView.frame = self.bounds;
    
    self.imageView = [[UIImageView alloc] initWithImage:self.image];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.userInteractionEnabled = YES;
    self.imageView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.imageView];
    self.imageView.frame = self.bounds;
    
    CGSize imageSize = self.imageView.image.size;
    CGSize viewSize = self.frame.size;
    _scale = viewSize.width / imageSize.width * imageSize.height < viewSize.height ? viewSize.width / imageSize.width : viewSize.height / imageSize.height;
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

- (void)brush:(NSArray *)pointsArray {
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(self.coverImageView.bounds.size, NO, 0);
    // 获取当前上下文
    CGContextRef ctx2 = UIGraphicsGetCurrentContext();
    // 渲染控件
    [self.coverImageView.layer renderInContext:ctx2];
    
    CGFloat wh = 20;
    for (NSArray *line in pointsArray) {
        for (int i=0; i<line.count; i++) {
            NSValue *pointValue = line[i];
            CGPoint point = [pointValue CGPointValue];
            if (CGPointEqualToPoint(self.topLeftCorner, CGPointZero) || CGPointEqualToPoint(self.bottomrigntCorner, CGPointZero)) {
                self.topLeftCorner = CGPointMake(point.x, point.y);
                self.bottomrigntCorner = CGPointMake(point.x+wh, point.y+wh);
            } else {
                CGFloat topLeftCornerX = self.topLeftCorner.x < point.x-wh/2 ? self.topLeftCorner.x : point.x-wh/2;
                CGFloat topLeftCornerY = self.topLeftCorner.y < point.y-wh/2 ? self.topLeftCorner.y : point.y-wh/2;
                CGFloat bottomRightCornerX = self.bottomrigntCorner.x > point.x+wh/2 ? self.bottomrigntCorner.x : point.x+wh/2;
                CGFloat bottomRightCornerY = self.bottomrigntCorner.y > point.y+wh/2 ? self.bottomrigntCorner.y : point.y+wh/2;
                self.topLeftCorner = CGPointMake(topLeftCornerX, topLeftCornerY);
                self.bottomrigntCorner = CGPointMake(bottomRightCornerX, bottomRightCornerY);
            }
            // 擦除上下文的某一部分
            CGRect rect = CGRectMake(point.x-wh/2, point.y-wh/2, wh, wh);
            CGContextClearRect(ctx2, rect);
        }
    }
    
    // 生成一张图片
    UIImage *coverImage = UIGraphicsGetImageFromCurrentImageContext();
    self.coverImageView.image = coverImage;
    // 关闭上下文
    UIGraphicsEndImageContext();
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

- (UIImage *)getSmallImage {

    [self.coverImageView removeFromSuperview];
    [self addSubview:self.coverImageView];
    
    CGRect rect = CGRectMake(self.topLeftCorner.x, self.topLeftCorner.y, self.bottomrigntCorner.x - self.topLeftCorner.x, self.bottomrigntCorner.y - self.topLeftCorner.y);
    CGFloat backImageViewX = rect.origin.x / _scale;
    CGFloat backImageViewY = rect.origin.y / _scale;
    CGFloat backImageViewW = rect.size.width / _scale;
    CGFloat backImageViewH = rect.size.height / _scale;
    CGRect backImageViewFrame = CGRectMake(backImageViewX, backImageViewY, backImageViewW, backImageViewH);
    
    self.frame = CGRectMake(0, 0, self.bounds.size.width/_scale, self.bounds.size.height/_scale);
    self.imageView.frame = CGRectMake(0, self.imageView.frame.origin.y/_scale, self.imageView.bounds.size.width/_scale, self.imageView.bounds.size.height/_scale);
    self.coverImageView.frame = self.imageView.bounds;
    
    return [self imageFromView:self atFrame:backImageViewFrame];
}

@end
