//
//  ColorfullCircleProgress.m
//  Progress_ColorfullCircle
//
//  Created by maginawin on 15-1-27.
//  Copyright (c) 2015年 mycj.wwd. All rights reserved.
//

#import "ColorfullCircleProgress.h"

#define CIRCLE_WIDTH 2.8

@interface ColorfullCircleProgress()

@property (nonatomic, strong) CAShapeLayer* circleLayer;

@end

@implementation ColorfullCircleProgress

#pragma mark - init methods

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setColorImage:[UIImage imageNamed:@"color"]];
        [self setFrontImageWithColor:[UIColor whiteColor]];
//        [self setProgress:0.5];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setColorImage:[UIImage imageNamed:@"color"]];
        [self setFrontImageWithColor:[UIColor whiteColor]];
    }
    return self;
}

// 添加背景图
- (void)setColorImage:(UIImage*)colorImage {
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.image = colorImage;
    [self addSubview:imageView];
}

// 添加前景图, 用贝塞尔曲线
- (void)setFrontImageWithColor:(UIColor*)color {
    _circleLayer = [CAShapeLayer layer];
    _circleLayer.strokeColor = color.CGColor;
    _circleLayer.fillColor = [UIColor clearColor].CGColor;
    _circleLayer.lineWidth = CIRCLE_WIDTH;
//    _circleLayer.lineJoin = kCALineJoinRound; // 连接样式
//    _circleLayer.lineCap = kCALineCapRound; // 头的样式
    _circleLayer.zPosition = 2;
    // 绘制一个贝塞尔曲线
    UIBezierPath* path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:CGPointMake(70, 70) radius:65.6 startAngle:-M_PI_2 endAngle:3 * M_PI_2 clockwise:NO];
    _circleLayer.path = path.CGPath;
    [self.layer addSublayer:_circleLayer];
}

- (void)setProgress:(CGFloat)value {
    
    if (value < 0) {
        value = 0.0f;
    } else if (value > 1) {
        value = 1.0f;
    }

    CATransition* transition = [CATransition animation];
    transition.duration = 0.5f;
    transition.type = kCATransitionFade;
    [_circleLayer addAnimation:transition forKey:@"animation"];
//    _circleLayer.path = nil;
    _circleLayer.path = [self getBezierPathFromProgress:value].CGPath;
}

- (UIBezierPath*)getBezierPathFromProgress:(CGFloat)value {
    UIBezierPath* path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:CGPointMake(70, 70) radius:65.6 startAngle:3 * M_PI_2 endAngle:(4 * value - 1) * M_PI_2 clockwise:NO];
    return path;
}

@end
