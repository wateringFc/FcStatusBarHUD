//
//  FcStatusBarHUD.m
//  FcStatusBarHUD
//
//  Created by 方存 on 16/8/15.
//  Copyright © 2016年 健康宝. All rights reserved.
//

#import "FcStatusBarHUD.h"
#define Screen_W [UIScreen mainScreen].bounds.size.width
#define Screen_H [UIScreen mainScreen].bounds.size.height
#define FcMessageFont [UIFont systemFontOfSize:13]

// 1.1.1  3.4.2 大版本号.功能更新版本号.BUG修复版本号

/** 全局窗口 */
static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;
/** 消息停留时间 */
static CGFloat const FcMessageDuration = 2.0;
/** 动画时间 */
static CGFloat const FcAnimationDuration = 0.25;

@implementation FcStatusBarHUD
/**
 *  显示窗口
 */
+ (void)showWimdow
{
    // frame数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, Screen_W, windowH);
    // 显示窗口
    window_.hidden = YES;// 防止多次创建窗口，残留窗口
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:FcAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

/**
 *  显示普通信息 + 图片
 *
 *  @param msg   文字
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    // 停止计时
    [timer_ invalidate];
    // 显示窗口
    [self showWimdow];
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = FcMessageFont;
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    // 定时消失
    timer_ = [NSTimer scheduledTimerWithTimeInterval:FcMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**
 *  显示文本信息
 *
 *  @param msg   文字
 */
+ (void)showMessage:(NSString *)msg
{
    [self showMessage:msg image:nil];
}

/**
 *  显示成功信息
 *
 *  @param msg   文字
 */
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"FcStatusBarHUD.bundle/check"]];
}

/**
 *  显示失败信息
 *
 *  @param msg   文字
 */
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"FcStatusBarHUD.bundle/error"]];
}

/**
 *  显示正在处理信息
 *
 *  @param msg   文字
 */
+ (void)showLoading:(NSString *)msg
{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    [self showWimdow];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = FcMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = msg;
    [window_ addSubview:label];
    
    // 添加菊花
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    // 计算文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : FcMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
    
}


/**
 *  隐藏指示器
 */
+ (void)hide
{
    [UIView animateWithDuration:FcAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

@end
