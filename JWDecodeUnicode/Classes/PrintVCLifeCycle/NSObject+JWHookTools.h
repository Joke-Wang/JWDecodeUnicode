//
//  NSObject+JWHookTools.h
//  JZAppModule_Example
//
//  Created by Joke Wang on 2023/4/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JWHookTools)

+ (void)hookFunction:(SEL)function
            callback:(void(^)(id target, SEL action))callback;


@end

NS_ASSUME_NONNULL_END
