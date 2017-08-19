//
//  LRRModuleProtocol.h
//  LRRouter
//
//  Created by leo on 2017/8/18.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LRRModuleProtocol <NSObject>

+(instancetype)lrrModuleInstance;

+(NSString *)lrrPath;

@end
