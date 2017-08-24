//
//  LRRouter.h
//  LRRouter
//
//  Created by leo on 2017/8/17.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LRRAnnotation.h"
#import "LRRModuleProtocol.h"
#import "LRRModuleMacro.h"

@interface LRRouter : NSObject

//+(instancetype)lrrHandleURL:(NSString *)url;
//+(instancetype)lrrHandleURL:(NSString *)url params:(NSDictionary *)params;

+(id)lrrHandleClassMethod:(NSString *)method path:(NSString *)path params:(NSDictionary *)params;

@end



@interface LRRouter (debug)

//在调用的时候  建议在load方法里面加上这个检测方法  请放心  只有debug模式才会起作用
+(void)lrrCheckClassMethod:(NSString *)method path:(NSString *)path;

@end

