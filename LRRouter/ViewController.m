//
//  ViewController.m
//  LRRouter
//
//  Created by leo on 2017/8/17.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import "ViewController.h"
#import "LRRouter.h"

@interface ViewController ()

-(void)cool;

@end

@implementation ViewController

+(void)load{
    
}

-(void)cool{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [LRRouter lrrHandleClassMethod:@"get:" path:@"TTT/AAA" params:@[@"11",@"bb"]];
//    [LRRouter lrrHandleClassMethod:@"aaa" path:@"TTT/AAA" params:@{@"aa":@"bb"}];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
