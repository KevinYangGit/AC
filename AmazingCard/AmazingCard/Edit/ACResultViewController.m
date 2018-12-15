//
//  ACResultViewController.m
//  AmazingCard
//
//  Created by 杨琦 on 2018/12/14.
//  Copyright © 2018 A.C. All rights reserved.
//

#import "ACResultViewController.h"

@interface ACResultViewController ()

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ACResultViewController

- (instancetype)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        self.image = image;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.imageView = [[UIImageView alloc] initWithImage:self.image];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView];
    self.imageView.frame = self.view.frame;
}


@end
