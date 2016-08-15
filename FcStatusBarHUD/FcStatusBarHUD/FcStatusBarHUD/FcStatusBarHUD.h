//
//  FcStatusBarHUD.h
//  FcStatusBarHUD
//
//  Created by 方存 on 16/8/15.
//  Copyright © 2016年 健康宝. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FcStatusBarHUD : NSObject

/**
 *  显示文本信息
 */
+ (void)showMessage:(NSString *)msg;

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;

/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg;

/**
 *  显示正在处理信息
 */
+ (void)showLoading:(NSString *)msg;

/**
 *  显示普通信息 + 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 *  隐藏指示器
 */
+ (void)hide;

@end
