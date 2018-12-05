//
//  ACDevice.h
//  AmazingCard
//
//  Created by 杨琦 on 2018/12/5.
//  Copyright © 2018 A.C. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//判定是否是ipad
#define DeviceToolsIsPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/**
 推荐使用
 根据ipad和6p适配尺寸
 
 @param valueiPad ipad数值
 @param baseOn6P 6p尺寸
 @return 折算后的尺寸
 */
#define scaleForiPadAndBaseOn6p(valueiPad,baseOn6P) (DeviceToolsIsPad?(valueiPad):(scaleTransitionBasedOnIphone6p(baseOn6P)))

/**
 根据iphone6p的尺寸推算出其他类型iphone的尺寸；如果设计图只给出了iphone6p的一套尺寸，则用这个宏
 
 @param valueForIPhone6p 6p尺寸
 @return 折算后的尺寸
 */
#define scaleTransitionBasedOnIphone6p(valueForIPhone6p) ([ACDevice isPad] ?(valueForIPhone6p * 1.4):([ACDevice is5p5InchPhone] ? ( (valueForIPhone6p)) : ([ACDevice is4p7InchPhoneOrIs5p8FullScreen] ? (valueForIPhone6p * 0.905) : ([ACDevice is3p5InchPhone]?(0.905 * 0.725 * (valueForIPhone6p)):(0.905 * 0.854 * (valueForIPhone6p))))))

@interface ACDevice : NSObject

+ (BOOL)isPhone;
+ (BOOL)isPad;
+ (BOOL)is3p5InchPhone;
+ (BOOL)is4InchPhone;
+ (BOOL)is4p7InchPhone;
+ (BOOL)is5p5InchPhone;
+ (BOOL)is5p8FullScreen;
+ (BOOL)is4p7InchPhoneOrIs5p8FullScreen;

@end

NS_ASSUME_NONNULL_END
