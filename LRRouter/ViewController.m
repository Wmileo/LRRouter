//
//  ViewController.m
//  LRRouter
//
//  Created by leo on 2017/8/17.
//  Copyright © 2017年 leospace. All rights reserved.
//

#import "ViewController.h"
#import "LRRouter.h"

LRRModule(ViewController)

@interface ViewController ()

-(void)cool;

@end

@implementation ViewController

-(void)cool{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",[LRRAnnotation annotationModules]);
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
