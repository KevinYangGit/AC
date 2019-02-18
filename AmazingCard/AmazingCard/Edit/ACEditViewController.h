//
//  ACEditViewController.h
//  AmazingCard
//
//  Created by 杨琦 on 2018/12/5.
//  Copyright © 2018 A.C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACImageVIewContainer.h"
#import "ACResultViewController.h"

typedef NS_ENUM(NSUInteger, ACEditViewControllerType) {
    ACEditViewControllerType_Circle,
    ACEditViewControllerType_Brush
};

static CGFloat scale(UIView *superView, UIImageView *imageView) {
    CGSize imageSize = imageView.image.size;
    CGSize viewSize = superView.frame.size;
    CGFloat scale = viewSize.width / imageSize.width * imageSize.height < viewSize.height ? viewSize.width / imageSize.width : viewSize.height / imageSize.height;
    return scale;
}

static CGFloat offset = 20;

@interface ACEditViewController : UIViewController

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIImageView *imageViewTop;
@property (nonatomic, strong) UIView *alphaView;
@property (nonatomic, strong) UIImageView *imageViewMiddle;
@property (nonatomic, strong) ACImageVIewContainer *backImageView;
@property (nonatomic, assign) CGPoint topLeftCorner;
@property (nonatomic, assign) CGPoint bottomrigntCorner;

@property (nonatomic, strong) UIView *clipView;
@property (nonatomic, assign) CGPoint startP;
@property (nonatomic, assign) CGPoint curP;


- (instancetype)initWithType:(ACEditViewControllerType)type;

@end
