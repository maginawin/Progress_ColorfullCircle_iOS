//
//  ViewController.m
//  Progress_ColorfullCircle
//
//  Created by maginawin on 15-1-27.
//  Copyright (c) 2015年 mycj.wwd. All rights reserved.
//

#import "ViewController.h"
#import "ColorfullCircleProgress.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ColorfullCircleProgress *progressView;
@property (nonatomic) CGFloat progressValue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _progressValue = 0.0;
}

#pragma mark - IBAction

- (IBAction)add:(id)sender {
    _progressValue += 0.01;
    [_progressView setProgress:_progressValue];
}

- (IBAction)minus:(id)sender {
    _progressValue -= 0.01;
    [_progressView setProgress:_progressValue];
}

@end
