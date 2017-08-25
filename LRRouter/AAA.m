//
//  AAA.m
//  LRRouter
//
//  Created by leo on 2017/8/21.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import "AAA.h"
#import "LRRouter.h"

LRRModule(AAA)

@implementation AAA

+(void)load{
//    [LRRouter lrrCheckClassMethod:@"set" path:@"TTT"];
}

+(NSString *)lrrPath{
    return @"TTT/AAA";
}

+(NSArray<NSString *> *)lrrClassMethods{
    return @[@"get:"];
}

//+(instancetype)lrrHandleClassMethod:(NSString *)method params:(NSDictionary *)params{
////    if ([method isEqualToString:@"get"]) {
////        NSLog(@"get");
////        [LRRouter lrrHandleClassMethod:@"set" path:@"TTT" params:params];
////    }
//    
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//    [self performSelector:NSSelectorFromString([NSString stringWithFormat:@"%@:",method]) withObject:params];
//#pragma clang diagnostic pop
//    
//    return nil;
//}

+(void)get:(NSString *)params{
    
    [LRRouter lrrHandleClassMethod:@"set:aa:" path:@"TTT" params:@[params,@"cc"]];
}

+(void)aaa:(NSDictionary *)params{
}

@end
