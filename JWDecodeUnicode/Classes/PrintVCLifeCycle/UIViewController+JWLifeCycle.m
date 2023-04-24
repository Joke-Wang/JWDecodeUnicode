//
//  UIViewController+JWLifeCycle.m
//  JWDecodeUnicode
//
//  Created by Joke Wang on 2023/4/24.
//

#import "UIViewController+JWLifeCycle.h"
#import "NSObject+JWHookTools.h"

@implementation UIViewController (JWLifeCycle)


+ (void)load {
    
    [self hookFunction:@selector(viewDidLoad) callback:^(id  _Nonnull target, SEL  _Nonnull action) {
        NSString *log = [NSString stringWithFormat:@"%@ [VC生命周期] %@ %@\n", [self localeDate], target, NSStringFromSelector(@selector(viewDidLoad))];
        printf("%s", [log UTF8String]);
    }];
    
    [self hookFunction:@selector(viewWillAppear:) callback:^(id  _Nonnull target, SEL  _Nonnull action) {
        NSString *log = [NSString stringWithFormat:@"%@ [VC生命周期] %@ %@\n", [self localeDate], target, NSStringFromSelector(@selector(viewWillAppear:))];
        printf("%s", [log UTF8String]);
    }];
    
//    [self hookFunction:@selector(viewWillLayoutSubviews) callback:^(id  _Nonnull target, SEL  _Nonnull action) {
//        NSString *log = [NSString stringWithFormat:@"%@ [VC生命周期] %@ %@\n", [self localeDate], target, NSStringFromSelector(@selector(viewWillLayoutSubviews))];
//        printf("%s", [log UTF8String]);
//    }];
//
//    [self hookFunction:@selector(viewDidLayoutSubviews) callback:^(id  _Nonnull target, SEL  _Nonnull action) {
//        NSString *log = [NSString stringWithFormat:@"%@ [VC生命周期] %@ %@\n", [self localeDate], target, NSStringFromSelector(@selector(viewDidLayoutSubviews))];
//        printf("%s", [log UTF8String]);
//    }];
//
//    [self hookFunction:@selector(viewDidAppear:) callback:^(id  _Nonnull target, SEL  _Nonnull action) {
//        NSString *log = [NSString stringWithFormat:@"%@ [VC生命周期] %@ %@\n", [self localeDate], target, NSStringFromSelector(@selector(viewDidAppear:))];
//        printf("%s", [log UTF8String]);
//    }];
    
    [self hookFunction:@selector(viewWillDisappear:) callback:^(id  _Nonnull target, SEL  _Nonnull action) {
        NSString *log = [NSString stringWithFormat:@"%@ [VC生命周期] %@ %@\n", [self localeDate], target, NSStringFromSelector(@selector(viewWillDisappear:))];
        printf("%s", [log UTF8String]);
    }];
    
//    [self hookFunction:@selector(viewDidDisappear:) callback:^(id  _Nonnull target, SEL  _Nonnull action) {
//        NSString *log = [NSString stringWithFormat:@"%@ [VC生命周期] %@ %@\n", [self localeDate], target, NSStringFromSelector(@selector(viewDidDisappear:))];
//        printf("%s", [log UTF8String]);
//    }];
    
//    [self hookFunction:@selector(dealloc) callback:^(id  _Nonnull target, SEL  _Nonnull action) {
//        NSString *log = [NSString stringWithFormat:@"%@ [VC生命周期] %@ %@\n", [self localeDate], target, NSStringFromSelector(@selector(dealloc))];
//    printf("%s", [log UTF8String]);
//    }];
    
}

+ (NSString *)localeDate {
    NSDate *date = [NSDate date];
    NSInteger interval = [[NSTimeZone localTimeZone] secondsFromGMTForDate:date];
    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    NSDateFormatter * formatter = [[NSDateFormatter alloc ] init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss.SSSSSSZ"];
    NSString *dateString =  [formatter stringFromDate:localeDate];
    
    return dateString;
}

@end
