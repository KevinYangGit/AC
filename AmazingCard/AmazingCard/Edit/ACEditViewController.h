//
//  ACEditViewController.h
//  AmazingCard
//
//  Created by 杨琦 on 2018/12/5.
//  Copyright © 2018 A.C. All rights reserved.
//

#import <UIKit/UIKit.h>

static CGFloat offset = 20;

@interface ACEditViewController : UIViewController

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *clipView;
@property (nonatomic, assign) CGPoint startP;
@property (nonatomic, assign) CGPoint curP;

@end
