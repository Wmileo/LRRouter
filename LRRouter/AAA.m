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

@interface AAA () <LRRModuleProtocol>



@end

@implementation AAA

+(NSString *)lrrPath{
    return @"TTT/AAA";
}

+(NSArray<NSString *> *)lrrClassMethods{
    return @[@"get"];
}

+(instancetype)lrrHandleClassMethod:(NSString *)method params:(NSDictionary *)params{
    if ([method isEqualToString:@"get"]) {
        NSLog(@"get");
        [LRRouter lrrHandleClassMethod:@"set" path:@"TTaT" params:params];
    }
    return nil;
}

@end
