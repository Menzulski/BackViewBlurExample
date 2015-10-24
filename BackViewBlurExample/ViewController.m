//
//  ViewController.m
//  BackViewBlurExample
//
//  Created by Stanislav Menzulski on 16.10.15.
//  Copyright © 2015 Stanislav Menzulski. All rights reserved.
//


//ViewController for BackViewBlur class example

#import "ViewController.h"
#import "BackViewBlur.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BackViewBlur *blurView = [BackViewBlur new];
    [blurView setFrame:CGRectMake((self.view.frame.size.width - 300)/2,(self.view.frame.size.height - 300)/2,300,300)];
    [self.view addSubview:blurView];
    
    //change back blur view color
    //[blurView changeBackViewBlurColor:[UIColor colorWithRed:140.0/255 green:140.0/255 blue:240.0/255 alpha:0.5]];
    //change back blur view style to black, default white
    //[blurView backViewBlackStyle:YES];
    
    //change back blur view alpha(from 0.9  to 1.0)
    //[blurView backViewBlurAlpha:0.9];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
