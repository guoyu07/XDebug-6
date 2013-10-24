//
//  UIControl+XDebug.m
//  RunTimeDemo
//
//  Created by Heramerom on 13-10-21.
//  Copyright (c) 2013年 Heramerom. All rights reserved.
//

#import "UIControl+XDebug.h"
#import <objc/runtime.h>

@implementation UIControl (XDebug)

#ifdef DEBUG

+ (void)load
{
    Method oldMethod = class_getInstanceMethod([UIButton class], @selector(sendAction:to:forEvent:));
    if (!oldMethod) return;
    Method newMethod = class_getInstanceMethod([UIButton class], @selector(logAndSendAction:to:forEvent:));
    if (!newMethod) return;
    method_exchangeImplementations(newMethod, oldMethod);
}

- (void)logAndSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    [self logAndSendAction:action to:target forEvent:event];
    NSLog(@"widget = %@, sel = %@, target = %@", self.class, NSStringFromSelector(action), [target class]);
}

#endif

@end
