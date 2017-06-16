//
//  ViewController.m
//  GPUImageMy
//
//  Created by ydz on 2017/6/5.
//  Copyright © 2017年 lgq. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"
#import "MVViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
    
}
- (IBAction)image:(id)sender {
    ImageViewController *ivc = [[ImageViewController alloc] init];
    [self presentViewController:ivc animated:YES completion:nil];
    
}

- (IBAction)mv:(id)sender {
    MVViewController *mvc = [[MVViewController alloc] init];
    [self presentViewController:mvc animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
