//
//  LRRAnnotation.h
//  LRRouter
//
//  Created by leo on 2017/8/18.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef LRRModuleSectName
#define LRRModuleSectName "LRRModules"
#endif

//将数据存到特定的数据段中
#define LRRDATA(sectname) __attribute((used, section("__DATA,"#sectname" ")))

//声明组件模块
#define LRRModule(name) \
char * k##name##_module LRRDATA(LRRModules) = ""#name""; \
@interface name () <LRRModuleProtocol> \
@end


@interface LRRAnnotation : NSObject


+(NSArray<NSString *> *)annotationModules;


@end
