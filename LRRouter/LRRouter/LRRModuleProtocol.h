//
//  LRRModuleProtocol.h
//  LRRouter
//
//  Created by leo on 2017/8/18.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LRRModuleProtocol <NSObject>

#pragma mark - 用于注册
+(NSString *)lrrPath;
+(NSArray<NSString *> *)lrrClassMethods;
+(NSArray<NSString *> *)lrrInstanceMethods;

@optional

#pragma mark - class
+(instancetype)lrrHandleClassMethod:(NSString *)method params:(NSDictionary *)params;

#pragma mark - instance
+(instancetype)lrrModuleInstance;
-(instancetype)lrrHandleInstanceMothod:(NSString *)method params:(NSDictionary *)params;

@end
