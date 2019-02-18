//
//  ACEditViewController+CTX.m
//  AmazingCard
//
//  Created by 杨琦 on 2018/12/17.
//  Copyright © 2018 A.C. All rights reserved.
//

#import "ACEditViewController+CTX.h"
#import "ACImageView.h"

@implementation ACEditViewController (CTX)

- (void)ctx {
    
    UIImage *amazingCardImage = [UIImage imageNamed:@"amazingCard"];
    CGSize imageSize = amazingCardImage.size;
    CGSize viewSize = self.view.bounds.size;
    CGFloat alphaViewWidth = self.view.bounds.size.width;
    CGFloat alphaViewHeight = alphaViewWidth * imageSize.height/imageSize.width;
    CGFloat alphaViewY = (viewSize.height - alphaViewHeight) / 2.0;
    CGRect imageViewFrame = CGRectMake(0, alphaViewY, alphaViewWidth, alphaViewHeight);
    self.backImageView = [[ACImageVIewContainer alloc] initWithFrame:imageViewFrame image:amazingCardImage];
    [self.view insertSubview:self.backImageView atIndex:0];
    
    ACImageView *acImageView = [[ACImageView alloc] initWithFrame:imageViewFrame];
    [self.view addSubview:acImageView];
    
    __weak typeof(self) weakSelf = self;
    [acImageView setBrush:^(NSArray *pointsArray) {
        [weakSelf.backImageView brush:pointsArray];
    }];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                           target:self
                                                                                           action:@selector(rightBarButtonItem:)];
}

- (void)ctxImage:(UIImage *)image {
    
    UIImage *amazingCardImage = image;
    CGSize imageSize = amazingCardImage.size;
    CGSize viewSize = self.view.bounds.size;
    CGFloat alphaViewWidth = self.view.bounds.size.width;
    CGFloat alphaViewHeight = alphaViewWidth * imageSize.height/imageSize.width;
    CGFloat alphaViewY = (viewSize.height - alphaViewHeight) / 2.0;
    CGRect imageViewFrame = CGRectMake(0, alphaViewY, alphaViewWidth, alphaViewHeight);
    self.backImageView = [[ACImageVIewContainer alloc] initWithFrame:imageViewFrame image:amazingCardImage];
    [self.view insertSubview:self.backImageView atIndex:0];
    
    ACImageView *acImageView = [[ACImageView alloc] initWithFrame:imageViewFrame];
    [self.view addSubview:acImageView];
    
    __weak typeof(self) weakSelf = self;
    [acImageView setBrush:^(NSArray *pointsArray) {
        [weakSelf.backImageView brush:pointsArray];
    }];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                           target:self
                                                                                           action:@selector(rightBarButtonItem:)];
}


- (void)rightBarButtonItem:(UIBarButtonItem *)item {
    
    UIImage *image = [self.backImageView getSmallImage];
    ACResultViewController *resultVC = [[ACResultViewController alloc] initWithImage:image];
    [self.navigationController pushViewController:resultVC animated:YES];
}



@end
