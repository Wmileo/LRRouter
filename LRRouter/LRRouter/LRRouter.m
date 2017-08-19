//
//  LRRouter.m
//  LRRouter
//
//  Created by leo on 2017/8/17.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import "LRRouter.h"

@interface LRRouter ()

+ (instancetype)shareInstance;
@property (nonatomic, copy) NSArray<NSString *> *annotationModules;

@end

@implementation LRRouter



+ (instancetype)shareInstance
{
    static dispatch_once_t once;
    static id LRRInstance = nil;
    dispatch_once(&once, ^{
        LRRInstance = [[self alloc] init];
    });
    return LRRInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray *annotationModules = [LRRAnnotation annotationModules];
    }
    return self;
}

@end
