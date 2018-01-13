//
//  RHToast.h
//  RHKit
//
//  Created by 郭人豪 on 2017/12/20.
//  Copyright © 2017年 Abner_G. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RHToast : NSObject

/**
 弹出toast
 
 @param message  显示内容
 */
+ (void)showWithMessage:(NSString *)message;

/**
 弹出toast
 
 @param message  显示内容
 @param duration 显示时长
 */
+ (void)showWithMessage:(NSString *)message duration:(NSTimeInterval)duration;

/**
 弹出toast
 
 @param message  显示内容
 @param rotation 旋转角度
 */
+ (void)showWithMessage:(NSString *)message rotation:(CGFloat)rotation;

/**
 弹出toast
 
 @param message  显示内容
 @param duration 显示时间
 @param rotation 旋转角度
 */
+ (void)showWithMessage:(NSString *)message duration:(NSTimeInterval)duration rotation:(CGFloat)rotation;


@end
