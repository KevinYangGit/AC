//
//  ImagePicker.h
//  AmazingCard
//
//  Created by 杨琦 on 2019/2/18.
//  Copyright © 2019 A.C. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^PhotoOrAlbumImagePickerBlock)(UIImage *image);

@interface ImagePicker : NSObject

// 必须创建一个对象才行，才不会释放指针
// 必须先在使用该方法的控制器中初始化 创建这个属性，然后在对象调用如下方法

/**
 公共方法 选择图片后的图片回掉
 
 @param controller 使用这个工具的控制器
 @param photoBlock 选择图片后的回掉
 */
- (void)getPhotoAlbumOrTakeAPhotoWithController:(UIViewController *)controller photoBlock:(PhotoOrAlbumImagePickerBlock)photoBlock;

@end

NS_ASSUME_NONNULL_END
