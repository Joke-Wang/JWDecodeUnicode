//
//  NSObject+JHSwizzFunc.h
//  JDWorker
//
//  Created by Joke Wang on 2023/4/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JHSwizzFunc)

+ (void)swizzFuncWithOriginalFunc:(SEL)originalFunc
                     swizzledFunc:(SEL)swizzledFunc;

@end

static inline void JH_SwizzSelect(Class cls, SEL originalFunc, SEL swizzledFunc) {
    [cls swizzFuncWithOriginalFunc:originalFunc swizzledFunc:swizzledFunc];
}

NS_ASSUME_NONNULL_END
