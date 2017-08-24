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
@property (nonatomic, strong) NSMutableDictionary *annotationModules;

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
        [self registerAnnotationModules];
        NSLog(@"%@",self.annotationModules);
    }
    return self;
}

#pragma mark - 

+(id)lrrHandleClassMethod:(NSString *)method path:(NSString *)path params:(NSDictionary *)params{
    [self lrrCheckClassMethod:method path:path];
    
    NSDictionary *moduleDic = [[LRRouter shareInstance] moduleWithPath:path];
    Class module = NSClassFromString(moduleDic[kLRRModuleClass]);
    
    NSAssert([module respondsToSelector:NSSelectorFromString([NSString stringWithFormat:@"%@:",method])], @"未实现该方法");
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [module performSelector:NSSelectorFromString([NSString stringWithFormat:@"%@:",method]) withObject:params];
#pragma clang diagnostic pop

}

#pragma mark -

-(void)registerAnnotationModules{
    NSArray<NSString *> *annotationModules = [LRRAnnotation annotationModules];
    [annotationModules enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSAssert(LRRIsValidString(obj), @"类名obj不能为空");
        NSAssert([NSClassFromString(obj) conformsToProtocol:@protocol(LRRModuleProtocol)], @"未实现LRRModuleProtocol协议");
        NSAssert([NSClassFromString(obj) respondsToSelector:@selector(lrrPath)], @"未实现lrrPath方法");
        Class module = NSClassFromString(obj);
        NSAssert(LRRIsValidString([module lrrPath]), @"lrrPath不能为空");

        NSString *path = [module lrrPath];
        NSMutableDictionary *modules = [self moduleWithPath:path];
        
        modules[kLRRModuleClass] = obj;
        modules[kLRRModulePath] = path;
        if ([module respondsToSelector:@selector(lrrClassMethods)]) {
            NSArray *classMethods = [module lrrClassMethods];
            
#ifdef DEBUG
            [classMethods enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSAssert([module respondsToSelector:NSSelectorFromString([NSString stringWithFormat:@"%@:",obj])], @"未实现注册方法");
            }];
#endif
            
            modules[kLRRModuleClassMethods] = LRRSafeArray(classMethods);
        }else{
            modules[kLRRModuleClassMethods] = @[];
        }
        
    }];
}

-(NSMutableDictionary *)moduleWithPath:(NSString *)path{
    NSArray *paths = [path componentsSeparatedByString:@"/"];
    NSInteger index = 0;
    NSMutableDictionary *subModules = self.annotationModules;
    while (index < paths.count) {
        NSString *path = paths[index];
        if (!subModules[path]) {
            subModules[path] = [[NSMutableDictionary alloc] init];
        }
        subModules = subModules[path];
        index++;
    }
    return subModules;
}

#pragma mark - set get
-(NSMutableDictionary *)annotationModules{
    if (!_annotationModules) {
        _annotationModules = [[NSMutableDictionary alloc] init];
    }
    return _annotationModules;
}

@end


@implementation LRRouter (debug)

+(void)lrrCheckClassMethod:(NSString *)method path:(NSString *)path{
    
#ifdef DEBUG
    NSDictionary *moduleDic = [[LRRouter shareInstance] moduleWithPath:path];
    NSAssert(LRRIsValidString(moduleDic[kLRRModuleClass]), @"未定义该path");
    NSArray *classMethods = moduleDic[kLRRModuleClassMethods];
    NSAssert([classMethods containsObject:method], @"lrrClassMethods不支持实现该类方法");
#endif
}


@end


