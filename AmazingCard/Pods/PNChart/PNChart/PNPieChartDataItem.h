//
//  PNPieChartDataItem.h
//  PNChartDemo
//
//  Created by Hang Zhang on 14-5-5.
//  Copyright (c) 2014年 kevinzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PNPieChartDataItem : NSObject

+ (instancetype)dataItemWithValue:(CGFloat)value
                            color:(UIColor*)color;

+ (instancetype)dataItemWithValue:(CGFloat)value
                            color:(UIColor*)color
                      description:(NSString *)description;

@property (nonatomic) CGFloat   value;
@property (nonatomic) UIColor  *color;
@property (nonatomic) NSString *textDescription;

//hehejingjing
@property (nonatomic)UIColor *titlePathColor;
@property (nonatomic)CGFloat titlePathWidth;
@property (nonatomic)UIColor *titleColor;
@property (nonatomic)UIFont *titleFont;
+ (instancetype)dataItemWithValue:(CGFloat)value
                            color:(UIColor*)color
                      description:(NSString *)description titlePathColor:(UIColor *)titlePathColor titlePathLineWidth:(CGFloat)lineWidth titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont;

@end
