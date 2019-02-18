//
//  ACEditViewController+Circle.m
//  AmazingCard
//
//  Created by 杨琦 on 2018/12/11.
//  Copyright © 2018 A.C. All rights reserved.
//

#import "ACEditViewController+Circle.h"

@implementation ACEditViewController (Circle)

//- (void)circle {
//    
//    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"amazingCard"]];
//    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    self.imageView.userInteractionEnabled = YES;
//    [self.view addSubview:self.imageView];
//    
//    self.imageView.frame = self.view.bounds;
//    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
//    [self.imageView addGestureRecognizer:pan];
//    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
//    [self.imageView addGestureRecognizer:tap];
//    
//    UIView *clipV = [[UIView alloc] init];
//    clipV.backgroundColor = [UIColor redColor];
//    clipV.alpha = 0.5;
//    [self.view addSubview:clipV];
//    self.clipView = clipV;
//    self.clipView.hidden = YES;
//    self.clipView.frame = CGRectMake(self.view.center.x, self.view.center.y, 25, 25);
//    UIPanGestureRecognizer *clipViewPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
//    [self.clipView addGestureRecognizer:clipViewPan];
//    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(barButtonItem:)];
//}
//
//- (void)tap:(UIGestureRecognizer *)tap {
//    if (CGPointEqualToPoint(self.startP, CGPointZero)) {
//        CGPoint p = [tap locationInView:self.imageView];
//        NSLog(@"x = %f, y = %f", p.x, p.y);
//        self.clipView.frame = CGRectMake(0, 0, offset*2, offset*2);
//        self.clipView.center = p;
//        self.clipView.hidden = NO;
//        self.startP = self.clipView.frame.origin;
//    }
//}
//
//- (void)pan:(UIPanGestureRecognizer *)pan {
//    
//    CGPoint p = [pan locationInView:self.imageView];
//    NSLog(@"x = %f, y = %f", p.x, p.y);
//    
//    //添加拖拽
//    if ([pan.view isEqual:self.clipView]) {
////        if (self.clipView.frame.size.width > offset*2
////            && self.clipView.frame.size.height > offset*2)
////        {
////            //超出范围不可拖拽
////            CGRect frame = CGRectMake(self.clipView.frame.origin.x + offset/2, self.clipView.frame.origin.y+offset/2, self.clipView.frame.size.width-offset, self.clipView.frame.size.height-offset);
////            if (!CGRectContainsPoint(frame, p)) {
////                return;
////            }
////        }
//        
//        CGPoint translation = [pan translationInView:pan.view.superview];
//        CGPoint finalCenter = CGPointMake(pan.view.center.x + translation.x, pan.view.center.y + translation.y);
//        pan.view.center = finalCenter;
//        self.startP = self.clipView.frame.origin;
//        self.curP = CGPointMake(self.startP.x + self.clipView.frame.size.width, self.startP.y + self.clipView.frame.size.height);
//        [pan setTranslation:CGPointMake(0, 0) inView:pan.view];
//        return;
//    }
//    
//    //startP是否为空（第一次）
//    if (CGPointEqualToPoint(self.startP, CGPointZero)) {
//        self.startP = p;
//        self.startP = CGPointMake(p.x-offset, p.y-offset);
//        self.clipView.frame = CGRectMake(self.startP.x, self.startP.y, offset*2, offset*2);
//        
//    } else {
//        if (p.x < self.clipView.center.x) {
//            if (p.y > self.clipView.center.y) {
//                self.startP = CGPointMake(p.x, self.startP.y);
//                self.curP = CGPointMake(self.curP.x, p.y);
//            } else {
//                self.startP = p;
//            }
//        } else {
//            if (p.y < self.clipView.center.y) {
//                self.startP = CGPointMake(self.startP.x, p.y);
//                self.curP = CGPointMake(p.x, self.curP.y);
//            } else {
//                self.curP = p;
//            }
//        }
//        CGFloat offsetX = self.curP.x - self.startP.x;
//        CGFloat offsetY = self.curP.y - self.startP.y;
//        self.clipView.frame = CGRectMake(self.startP.x, self.startP.y, offsetX, offsetY);
//    }
//    self.clipView.hidden = NO;
//}
//
//- (void)barButtonItem:(UIBarButtonItem *)barButton {
//    CGRect clipViewframe = self.clipView.frame;
//    self.clipView.hidden = YES;
//    self.startP = CGPointZero;
//    self.curP = CGPointZero;
//    
//    CGFloat imageCurWidth = self.view.bounds.size.width;
//    CGFloat imageCurHeight = imageCurWidth * (self.imageView.image.size.height / self.imageView.image.size.width);
//    
//    CGFloat curClipY = clipViewframe.origin.y - (self.view.bounds.size.height - imageCurHeight) / 2.0;
//    CGFloat curClipX = clipViewframe.origin.x;
//    
//    CGFloat s = scale(self.view, self.imageView);
//    CGFloat clipY = curClipY / s;
//    CGFloat clipX = curClipX / s;
//    CGFloat clipW = clipViewframe.size.width / s;
//    CGFloat clipH = clipViewframe.size.height / s;
//    CGRect clipFrame = CGRectMake(clipX, clipY, clipW, clipH);
//    
//    UIImage *image = [self getImageFromImage:self.imageView.image rect:clipFrame];
////    self.imageView.image = image;
//    ACResultViewController *resultVC = [[ACResultViewController alloc] initWithImage:image];
//    [self.navigationController pushViewController:resultVC animated:YES];
//}
//
//-(UIImage *)getImageFromImage:(UIImage *)image rect:(CGRect)rect {
//    
//    //大图bigImage
//    //定义myImageRect，截图的区域
//    CGRect myImageRect = rect;
//    CGImageRef imageRef = image.CGImage;
//    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, myImageRect);
//    CGSize size = image.size;
//    UIGraphicsBeginImageContext(size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextDrawImage(context, myImageRect, subImageRef);
//    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
//    UIGraphicsEndImageContext();
//    
//    return smallImage;
//    
//}

@end
