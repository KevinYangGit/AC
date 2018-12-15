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


@interface ACEditViewController ()

@property (nonatomic, assign) ACEditViewControllerType type;

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
    
    if (self.type == ACEditViewControllerType_Circle) {
        [self circle];
    }
    if (self.type == ACEditViewControllerType_Brush) {
        [self brush];
    }
}



@end
