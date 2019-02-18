//
//  ACImageView.m
//  AmazingCard
//
//  Created by 杨琦 on 2018/12/17.
//  Copyright © 2018 A.C. All rights reserved.
//

#import "ACImageView.h"

@interface ACImageView()

@property (nonatomic, copy) NSMutableArray *lines;

@end

@implementation ACImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint startLocation = [touch locationInView:touch.view];
    // 开启一条新的线
    NSMutableArray *points = [NSMutableArray array];
    // 存储点信息到线上
    [points addObject:[NSValue valueWithCGPoint:startLocation]];
    // 存储到线组上
    [self.lines addObject:points];
    // 重绘
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:touch.view];
    // 拿到正在画的线
    NSMutableArray *points = [self.lines lastObject];
    // 添加点信息
    [points addObject:[NSValue valueWithCGPoint:location]];
    // 重绘
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesMoved:touches withEvent:event];
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 遍历线组，把所有线画出来
    for (NSArray *line in self.lines) {
        for (int i=0; i<line.count; i++) {
            NSValue *pointValue = line[i];
            CGPoint point = [pointValue CGPointValue];
            // 如果是线的第一个点，要先移动画笔到那个点
            if (0 == i) {
                CGContextMoveToPoint(ctx, point.x, point.y);
            } else {
                CGContextAddLineToPoint(ctx, point.x, point.y);
            }
        }
    }
    //设置绘图的状态
    //设置线条的颜色为蓝色
    CGContextSetRGBStrokeColor(ctx, 0, 1.0, 0, 0.5);
    // 设置线宽、线头样式、线转折样式
    CGContextSetLineWidth(ctx, 20);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    // 渲染
    CGContextStrokePath(ctx);
    if (self.brush) {
        self.brush(self.lines);
    }
}

#pragma mark - lazy
- (NSMutableArray *)lines {
    if (!_lines) {
        _lines = [[NSMutableArray alloc] init];
    }
    return _lines;
}

@end
