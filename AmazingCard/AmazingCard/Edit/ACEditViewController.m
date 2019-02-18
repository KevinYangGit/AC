//
//  ACEditViewController.m
//  AmazingCard
//
//  Created by 杨琦 on 2018/12/5.
//  Copyright © 2018 A.C. All rights reserved.
//

#import "ACEditViewController.h"
#import "ACEditViewController+Circle.h"
#import "ACEditViewController+Brush.h"
#import "ACEditViewController+CTX.h"
#import "TZImagePickerController.h"

@interface ACEditViewController ()<TZImagePickerControllerDelegate>

@property (nonatomic, assign) ACEditViewControllerType type;
@property (nonatomic, copy) NSArray *lines;

@end

@implementation ACEditViewController

- (instancetype)initWithType:(ACEditViewControllerType)type
{
    self = [super init];
    if (self) {
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    if (self.type == ACEditViewControllerType_Circle) {
//        [self circle];
//    }
//    if (self.type == ACEditViewControllerType_Brush) {
//        [self brush];
//    }
    
//    [self ctx];
    __weak typeof(self) weakSelf = self;
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:weakSelf];
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        if (photos.count > 0) {
            UIImage *image = photos.firstObject;
            [weakSelf ctxImage:image];
        }
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}


@end
