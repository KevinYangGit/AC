//
//  ACImageView.h
//  AmazingCard
//
//  Created by 杨琦 on 2018/12/17.
//  Copyright © 2018 A.C. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACImageView : UIView

@property (nonatomic, copy) void(^brush)(NSArray *pointsArray);

@end
