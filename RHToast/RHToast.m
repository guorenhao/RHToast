//
//  RHToast.m
//  RHKit
//
//  Created by 郭人豪 on 2017/12/20.
//  Copyright © 2017年 Abner_G. All rights reserved.
//

#import "RHToast.h"

#define RH_Toast_SWidth        [UIScreen mainScreen].bounds.size.width
#define RH_Toast_SHeight       [UIScreen mainScreen].bounds.size.height

@implementation RHToast


/**
 弹出toast
 
 @param message  显示内容
 */
+ (void)showWithMessage:(NSString *)message {
    
    [self showWithMessage:message duration:1.5 rotation:0];
}

/**
 弹出toast
 
 @param message  显示内容
 @param duration 显示时长
 */
+ (void)showWithMessage:(NSString *)message duration:(NSTimeInterval)duration {
    
    [self showWithMessage:message duration:duration rotation:0];
}

/**
 弹出toast
 
 @param message  显示内容
 @param rotation 旋转角度
 */
+ (void)showWithMessage:(NSString *)message rotation:(CGFloat)rotation {
    
    [self showWithMessage:message duration:1.5 rotation:rotation];
}

/**
 弹出toast
 
 @param message  显示内容
 @param duration 显示时间
 @param rotation 旋转角度
 */
+ (void)showWithMessage:(NSString *)message duration:(NSTimeInterval)duration rotation:(CGFloat)rotation {
    
    UIWindow * keyWindow = [UIApplication sharedApplication].keyWindow;
    CGRect frame = keyWindow.bounds;
    
    __block UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, RH_Toast_SWidth, RH_Toast_SHeight)];
    bgView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
    
    UIView * bgView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [self SS:150], [self SS:48])];
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, [self SS:150], [self SS:48])];
    textView.textContainerInset = UIEdgeInsetsMake([self SS:15], [self SS:15], [self SS:15], [self SS:15]);
    textView.layer.cornerRadius = [self SS:8];
    textView.layer.masksToBounds = YES;
    textView.font = [UIFont systemFontOfSize:[self SS:15]];
    textView.textColor = [UIColor whiteColor];
    textView.textAlignment = NSTextAlignmentCenter;
    textView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    textView.editable = NO;
    textView.text = message;
    
    CGFloat width = [self getTextViewWidthByText:message font:[UIFont systemFontOfSize:[self SS:15]]];
    if (width > [self SS:150]) {
        
        if (width > [self SS:200]) {
            
            CGFloat height = [self getTextViewHeightByText:message font:[UIFont systemFontOfSize:[self SS:15]] width:[self SS:200]];
            textView.frame = CGRectMake(0, 0, [self SS:200], height);
            bgView2.frame = CGRectMake(0, 0, [self SS:200], height);
        } else {
            
            textView.frame = CGRectMake(0, 0, width, [self SS:48]);
            bgView2.frame = CGRectMake(0, 0, width, [self SS:48]);
        }
    }
    
    if (rotation > 0) {
        
        bgView2.center = CGPointMake(frame.size.width / 2, frame.size.height / 2);
        CGAffineTransform transform = CGAffineTransformMakeRotation(rotation);
        bgView2.transform = transform;
    } else {
        
        bgView2.center = CGPointMake(frame.size.width / 2, frame.size.height / 2);
    }
    
    [bgView addSubview:bgView2];
    [bgView2 addSubview:textView];
    
    [keyWindow addSubview:bgView];
    
    NSInteger dur = 1.5;
    if (duration > 0) {
        
        dur = duration;
    }
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, dur * NSEC_PER_SEC);
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        
        [bgView removeFromSuperview];
        bgView = nil;
    });
}

#pragma mark - private

+ (CGFloat)getTextViewWidthByText:(NSString *)text font:(UIFont *)font {
    
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, MAXFLOAT, 0)];
    textView.textContainerInset = UIEdgeInsetsMake([self SS:15], [self SS:15], [self SS:15], [self SS:15]);
    textView.text = text;
    textView.font = font;
    [textView sizeToFit];
    CGFloat width = textView.frame.size.width;
    return width;
}

+ (CGFloat)getTextViewHeightByText:(NSString *)text font:(UIFont *)font width:(CGFloat)width {
    
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    textView.textContainerInset = UIEdgeInsetsMake([self SS:15], [self SS:15], [self SS:15], [self SS:15]);
    textView.text = text;
    textView.font = font;
    [textView sizeToFit];
    CGFloat height = textView.frame.size.height;
    return height;
}

+ (CGFloat)SS:(CGFloat)num {
    
    if (RH_Toast_SWidth < RH_Toast_SHeight) {
        
        CGFloat scaleSize = RH_Toast_SWidth / 375.0;
        return num * scaleSize;
    } else {
        
        CGFloat scaleSize = RH_Toast_SHeight / 375.0;
        return num * scaleSize;
    }
}

@end

