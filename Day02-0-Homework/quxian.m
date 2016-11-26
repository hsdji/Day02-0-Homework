//
//  quxian.m
//  Day02-0-Homework
//
//  Created by ekhome on 16/11/26.
//  Copyright © 2016年 tarena. All rights reserved.
//





#import "quxian.h"

@implementation quxian

-(void)drawRect:(CGRect)rect
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
//    找到起点位置
    [path moveToPoint:CGPointMake(0, CGRectGetHeight(self.frame)*0.5)];
//    开始画线
    [path addLineToPoint:CGPointMake(0, CGRectGetHeight(self.frame))];
    [path addLineToPoint:CGPointMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    [path addLineToPoint:CGPointMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)*0.5)];
//    开始画曲面
    [path addQuadCurveToPoint:CGPointMake(0, CGRectGetHeight(self.frame)*0.5) controlPoint:CGPointMake(CGRectGetWidth(self.frame)/2.0, 0)];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor greenColor].CGColor;
    [self.layer addSublayer:layer];
    
}

@end
