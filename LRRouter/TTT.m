//
//  TTT.m
//  LRRouter
//
//  Created by leo on 2017/8/19.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import "TTT.h"
#import "LRRouter.h"

LRRModule(TTT)

@interface TTT () <LRRModuleProtocol>

@end

@implementation TTT

+(NSString *)lrrPath{
    return @"TTT";
}

+(NSArray<NSString *> *)lrrClassMethods{
    return @[@"set"];
}

+(instancetype)lrrHandleClassMethod:(NSString *)method params:(NSDictionary *)params{
    if ([method isEqualToString:@"set"]) {
        NSLog(@"set");
    }
    return nil;
}

@end
