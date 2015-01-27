//
//  ColorfullCircleProgress.h
//  Progress_ColorfullCircle
//
//  Created by maginawin on 15-1-27.
//  Copyright (c) 2015年 mycj.wwd. All rights reserved.
//

#import <UIKit/UIKit.h>

// 引用的资源文件为 colorprogress 中的 color & white
// 尺寸: @3x: 图片: 420*420, 环: 396　环宽: 6
//      @1x: 140*140 132 2

@interface ColorfullCircleProgress : UIView

/*
 * 设置进度条的值, 范围在 0.0 ~ 1.0
 */
- (void)setProgress:(CGFloat)value;

@end
