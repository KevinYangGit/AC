//
//  ACEditViewController.m
//  AmazingCard
//
//  Created by 杨琦 on 2018/12/5.
//  Copyright © 2018 A.C. All rights reserved.
//

#import "ACEditViewController.h"

static CGFloat offset = 20;

@interface ACEditViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *clipView;
@property (nonatomic, assign) CGPoint startP;
@property (nonatomic, assign) CGPoint curP;

@end

@implementation ACEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"amazingCard"]];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.userInteractionEnabled = YES;
    [self.view addSubview:_imageView];
    
    _imageView.frame = self.view.bounds;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [_imageView addGestureRecognizer:pan];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [_imageView addGestureRecognizer:tap];
    
    UIView *clipV = [[UIView alloc] init];
    clipV.backgroundColor = [UIColor redColor];
    clipV.alpha = 0.5;
    [self.view addSubview:clipV];
    self.clipView = clipV;
    self.clipView.hidden = YES;
    self.clipView.frame = CGRectMake(self.view.center.x, self.view.center.y, 25, 25);
    UIPanGestureRecognizer *clipViewPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.clipView addGestureRecognizer:clipViewPan];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(barButtonItem:)];
}

- (void)tap:(UIGestureRecognizer *)tap {
    if (CGPointEqualToPoint(self.startP, CGPointZero)) {
        CGPoint p = [tap locationInView:self.imageView];
        NSLog(@"x = %f, y = %f", p.x, p.y);
        self.clipView.frame = CGRectMake(0, 0, offset*2, offset*2);
        self.clipView.center = p;
        self.clipView.hidden = NO;
        self.startP = self.clipView.frame.origin;
    }
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    
    CGPoint p = [pan locationInView:self.imageView];
    NSLog(@"x = %f, y = %f", p.x, p.y);

    if ([pan.view isEqual:self.clipView]) {
        if (self.clipView.frame.size.width > offset*2
            && self.clipView.frame.size.height > offset*2)
        {
            CGRect frame = CGRectMake(self.clipView.frame.origin.x + offset/2, self.clipView.frame.origin.y+offset/2, self.clipView.frame.size.width-offset, self.clipView.frame.size.height-offset);
            if (!CGRectContainsPoint(frame, p)) {
                return;
            }
        }
        
        CGPoint translation = [pan translationInView:pan.view.superview];
        CGPoint finalCenter = CGPointMake(pan.view.center.x + translation.x, pan.view.center.y + translation.y);
        pan.view.center = finalCenter;
        self.startP = self.clipView.frame.origin;
        [pan setTranslation:CGPointMake(0, 0) inView:pan.view];
        return;
    }

//    if (CGRectContainsPoint(self.clipView.frame, p)) {
//        return;
//    } else {
//        CGFloat x = p.x;
//        CGFloat y = p.y;
//    }
    if (CGPointEqualToPoint(self.startP, CGPointZero)) {
        self.startP = p;
        self.startP = CGPointMake(p.x-offset, p.y-offset);
        self.clipView.frame = CGRectMake(self.startP.x, self.startP.y, offset*2, offset*2);

    } else {
        self.curP = p;
        CGFloat offsetX = self.curP.x - self.startP.x;
        CGFloat offsetY = self.curP.y - self.startP.y;
        self.clipView.frame = CGRectMake(self.startP.x, self.startP.y, offsetX, offsetY);
    }
    self.clipView.hidden = NO;
}

- (void)barButtonItem:(UIBarButtonItem *)barButton {
    CGRect clipViewframe = self.clipView.frame;
    self.clipView.hidden = YES;
    self.startP = CGPointZero;
    self.curP = CGPointZero;
    
    CGFloat imageCurWidth = self.view.bounds.size.width;
    CGFloat imageCurHeight = imageCurWidth * self.imageView.image.size.height /self.imageView.image.size.width;
    
    CGFloat curClipY = clipViewframe.origin.y - (self.view.bounds.size.height - imageCurHeight) / 2.0;
    CGFloat curClipX = clipViewframe.origin.x;
    
    CGSize size = self.imageView.image.size;
    CGSize viewSize = self.view.frame.size;
    CGFloat scale = viewSize.width / size.width * size.height < viewSize.height ? viewSize.width / size.width : viewSize.height / size.height;
    CGFloat clipY = curClipY / scale;
    CGFloat clipX = curClipX / scale;
    CGFloat clipW = clipViewframe.size.width / scale;
    CGFloat clipH = clipViewframe.size.height / scale;
    CGRect clipFrame = CGRectMake(clipX, clipY, clipW, clipH);
    
    UIImage *image = [self getImageFromImage:self.imageView.image rect:clipFrame];
    self.imageView.image = image;
}

-(UIImage *)getImageFromImage:(UIImage *)image rect:(CGRect)rect {
    
    //大图bigImage
    //定义myImageRect，截图的区域
    CGRect myImageRect = rect;
    CGImageRef imageRef = image.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, myImageRect);
    CGSize size = image.size;
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, myImageRect, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return smallImage;
    
}

@end
