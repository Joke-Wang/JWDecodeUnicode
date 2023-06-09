//
//  NSArray+JHUnicode.m
//  JDWorker
//
//  Created by Joke Wang on 2023/4/24.
//

#import "NSArray+JHUnicode.h"
#import "NSObject+JHSwizzFunc.h"
#import "NSString+JHUnicode.h"

@implementation NSArray (JHUnicode)

+ (void)load {
    
    Class cls = [self class];
    
    JH_SwizzSelect(cls, @selector(description), @selector(jh_description));
    JH_SwizzSelect(cls, @selector(descriptionWithLocale:), @selector(jh_descriptionWithLocale:));
    JH_SwizzSelect(cls, @selector(descriptionWithLocale:indent:), @selector(jh_descriptionWithLocale:indent:));
    
}

- (NSString *)jh_description {
    return [[self jh_description] stringByReplaceUnicode];
}

- (NSString *)jh_descriptionWithLocale:(id)locale {
    return [[self jh_descriptionWithLocale:(locale ? locale : [NSLocale currentLocale])] stringByReplaceUnicode];
}

- (NSString *)jh_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return [[self jh_descriptionWithLocale:(locale ? locale : [NSLocale currentLocale]) indent:level] stringByReplaceUnicode];
}

@end
