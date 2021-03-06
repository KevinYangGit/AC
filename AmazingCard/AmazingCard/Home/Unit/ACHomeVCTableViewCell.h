//
//  ACHomeVCTableViewCell.h
//  AmazingCard
//
//  Created by 杨琦 on 2018/12/5.
//  Copyright © 2018 AmazingCard. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACHomeVCTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImage *mainImage;
@property (nonatomic, copy) void(^containterTapAction)();

@end

NS_ASSUME_NONNULL_END
