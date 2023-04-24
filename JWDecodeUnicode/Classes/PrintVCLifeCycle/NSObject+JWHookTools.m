//
//  NSObject+JWHookTools.m
//  JZAppModule_Example
//
//  Created by Joke Wang on 2023/4/24.
//

#import "NSObject+JWHookTools.h"
#import <objc/runtime.h>

typedef void (* _IMP)(id, SEL,...);


@implementation NSObject (JWHookTools)

+ (void)hookFunction:(SEL)function callback:(void(^)(id target, SEL action))callback {
    
    Class className = [self class];
    Method hookMethod = class_getInstanceMethod(className, function);
    _IMP hookMethod_IMP = (_IMP)method_getImplementation(hookMethod);
    method_setImplementation(hookMethod, imp_implementationWithBlock(^(id target, SEL action) {
        hookMethod_IMP(target, function);
        
        !callback ?: callback(target, action);
        
    }));
}

@end
