//
//  ColorfullCircleProgress.m
//  Progress_ColorfullCircle
//
//  Created by maginawin on 15-1-27.
//  Copyright (c) 2015年 mycj.wwd. All rights reserved.
//

#import "ColorfullCircleProgress.h"

#define CIRCLE_WIDTH 2.8
#define DEGREES_TO_RADIANS(angle) ((angle) / 180 * M_PI)

@interface ColorfullCircleProgress()

@property (nonatomic, strong) CAShapeLayer* circleLayer;

@end

@implementation ColorfullCircleProgress

#pragma mark - init methods

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setColorImage:[UIImage imageNamed:@"color"]];
        [self setFrontImageWithColor:[UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1.0]];
//        [self setProgress:0.5];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setColorImage:[UIImage imageNamed:@"color"]];
        [self setFrontImageWithColor:[UIColor colorWithRed:249/255.0 green:133/255.0 blue:8/255.0 alpha:1.0]];
//        [self setFrontImageWithColor:[UIColor clearColor]];
    }
    return self;
}

// 添加背景图
- (void)setColorImage:(UIImage*)colorImage {
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.image = colorImage;
    imageView.layer.zPosition = -1;
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
    _circleLayer.zPosition = 1;
    // 绘制一个贝塞尔曲线
    UIBezierPath* path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:CGPointMake(70, 70) radius:65.6 startAngle:DEGREES_TO_RADIANS(270.00) endAngle:DEGREES_TO_RADIANS(270.01) clockwise:NO];
    _circleLayer.path = path.CGPath;
    _circleLayer.strokeStart = 0.0f;
    _circleLayer.strokeEnd = 1.0f;
    [self.layer addSublayer:_circleLayer];
    _current = 0.0f;
    [self setProgress:0.0f];
}

- (void)setProgress:(CGFloat)value {
    
    if (value < 0) {
        value = 0.0f;
    } else if (value > 1) {
        value = 1.0f;
    }
    
    // Add animation
    CABasicAnimation* pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0f;
    pathAnimation.fromValue = @((1.0 - _current) / 1.0);
    _current = value;
    pathAnimation.toValue = @((1.0 - _current) / 1.0);
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    _circleLayer.strokeEnd = (1.0 - _current) / 1.0;
    [_circleLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
}

@end
