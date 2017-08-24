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

@interface TTT ()
@property (nonatomic) NSArray *arr;
@end

@implementation TTT

+(NSString *)lrrPath{
    return @"TTT";
}

+(NSArray<NSString *> *)lrrClassMethods{
    return @[NSStringFromSelector(@selector(set:aa:))];
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.arr = @[];
    }
    return self;
}

//+(instancetype)lrrHandleClassMethod:(NSString *)method params:(NSDictionary *)params{
//    if ([method isEqualToString:@"set"]) {
//        NSLog(@"%@",params);
//    }
//    return nil;
//}

+(void)set:(NSInteger)aa aa:(NSString *)bb{
    NSLog(@"set%zd%@",aa,bb);
}

@end
