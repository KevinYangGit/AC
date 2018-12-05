//
//  PNPieChartDataItem.m
//  PNChartDemo
//
//  Created by Hang Zhang on 14-5-5.
//  Copyright (c) 2014年 kevinzhow. All rights reserved.
//

#import "PNPieChartDataItem.h"
#import <UIKit/UIKit.h>

@implementation PNPieChartDataItem


+ (instancetype)dataItemWithValue:(CGFloat)value
                            color:(UIColor*)color{
    PNPieChartDataItem *item = [PNPieChartDataItem new];
    item.value = value;
    item.color  = color;
    item.textDescription = @"";
    item.titlePathColor = [UIColor blackColor];
    item.titlePathWidth = 0.5;
    item.titleColor = [UIColor blackColor];
    item.titleFont = [UIFont systemFontOfSize:12];
    return item;
}

+ (instancetype)dataItemWithValue:(CGFloat)value
                            color:(UIColor*)color
                      description:(NSString *)description {
    PNPieChartDataItem *item = [PNPieChartDataItem dataItemWithValue:value color:color];
    item.textDescription = description;
    return item;
}

+ (instancetype)dataItemWithValue:(CGFloat)value
                            color:(UIColor*)color
                      description:(NSString *)description titlePathColor:(UIColor *)titlePathColor titlePathLineWidth:(CGFloat)lineWidth titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont {
    PNPieChartDataItem *item = [self dataItemWithValue:value color:color description:description];
    item.titlePathColor = titlePathColor;
    item.titlePathWidth = lineWidth;
    item.titleColor = titleColor;
    item.titleFont = titleFont;
    return item;
}

- (void)setValue:(CGFloat)value{
    NSAssert(value >= 0, @"value should >= 0");
    if (value != _value){
        _value = value;
    }
}

@end
