//
//  Numbers.h
//  boxfish-english
//
//  Created by echo on 14-11-19.
//  Copyright (c) 2014年 boxfish. All rights reserved.
//

#pragma once

#define PageTransitionTime 0.5f
#define PageControlHeight 30
#define TitleFontSize (32 * 4 / 3) //32是point 乘以4/3是转化为pixel单位
//屏幕宽度
#define Screen_Width (CGRectGetWidth([UIScreen mainScreen].bounds))
//屏幕高度
#define Screen_Height (CGRectGetHeight([UIScreen mainScreen].bounds))


// for teacher
#define NoClassFlag -1
#define ExamOperationViewRect CGRectMake(0, 0, 260, 260)

// for student
#define StatisticReductionConstant 10

#define isiPhoneX (Screen_Width == 375 && Screen_Height == 812 ? YES : NO)
#define isiPhone8 (Screen_Width == 375 && Screen_Height == 667 ? YES : NO)
#define isiPhone8P (Screen_Width == 414 && Screen_Height == 736 ? YES : NO)

//适配iPhone X
#define StatusBarHeight (isiPhoneX ? 44 : 20)
#define StatusBarIncrease (isiPhoneX ? 24 : 0)

#define NavigationBarHeight 44
#define NavigationBigCourseTitleHeight 82
#define NavigationAndStatusHeight (StatusBarHeight + NavigationBarHeight)
#define TabBarHeight (isiPhoneX ? (49 + 34) : 49)
#define HomeIndicatorHeight (isiPhoneX ? 34 : 0)
#define HomeIndicatorHeightExtra (isiPhoneX ? 34 + 20 : 0)
#define HomeIndicatorBottomMargin(floatValue) (isiPhoneX ? ((floatValue) < 34 ? 34 : floatValue) : floatValue)

#define iPHoneTestContentHeight (480 - StatusBarHeight)

#define DefaultAnswerItemNumber 4

#define GroupNameLimit 10
#define NameLengthLowerLimit 2
#define NameLengthUpperLimit 64
#define PasswordLengthLowerLimit 6
#define PasswordLengthUpperLimit 32
#define DefaultUITableCellHeight 44
