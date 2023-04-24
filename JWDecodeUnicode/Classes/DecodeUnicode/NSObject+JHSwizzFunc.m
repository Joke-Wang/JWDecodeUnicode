//
//  NSObject+JHSwizzFunc.m
//  JDWorker
//
//  Created by Joke Wang on 2023/4/24.
//

#import "NSObject+JHSwizzFunc.h"
#import <objc/runtime.h>

@implementation NSObject (JHSwizzFunc)
     
+ (void)swizzFuncWithOriginalFunc:(SEL)originalFunc
                     swizzledFunc:(SEL)swizzledFunc
{
    Class className = [self class];
    Method originalMethod = class_getInstanceMethod(className, originalFunc);
    Method swizzledMethod = class_getInstanceMethod(className, swizzledFunc);
    
    if (class_addMethod(className, originalFunc, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(className, originalFunc, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
