//
//  UITableView+RunTime.m
//  RunTimeDemo
//
//  Created by Heramerom on 13-10-21.
//  Copyright (c) 2013年 Heramerom. All rights reserved.
//

#import "UITableView+XDebug.h"
#import <objc/runtime.h>

@implementation UITableView (XDebug)

#ifdef DEBUG

+ (void)load
{
    Method oldMethod = class_getInstanceMethod([self class], @selector(setDelegate:));
    if (!oldMethod) return;
    Method newMethod = class_getInstanceMethod([self class], @selector(setXDebugDelegate:));
    if (!newMethod) return;
    method_exchangeImplementations(oldMethod, newMethod);
}

- (void)setXDebugDelegate:(id<UITableViewDelegate>)delegate
{
    [self setXDebugDelegate:delegate];
    
    IMP imp = class_getMethodImplementation([self class], @selector(xTableView:didSelectRowAtIndexPath:));
    Method m = class_getInstanceMethod([self class], @selector(xTableView:didSelectRowAtIndexPath:));
    char * vartypes = method_getDescription(m)->types;
    if (!class_addMethod(delegate.class, @selector(xTableView:didSelectRowAtIndexPath:), imp, vartypes))
        return;
    Method oldMethod = class_getInstanceMethod(delegate.class, @selector(tableView:didSelectRowAtIndexPath:));
    if (!oldMethod) return;
    Method newMethod = class_getInstanceMethod([delegate class], @selector(xTableView:didSelectRowAtIndexPath:));
    if (!newMethod) return;
    method_exchangeImplementations(oldMethod, newMethod);
}

- (void)xTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self xTableView:tableView didSelectRowAtIndexPath:indexPath];
    NSLog(@"class = %@ row = %d section = %d", [self class], indexPath.row, indexPath.section);
}

#endif


@end
