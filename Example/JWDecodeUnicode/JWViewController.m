//
//  JWViewController.m
//  JWDecodeUnicode
//
//  Created by 王章仲 on 04/24/2023.
//  Copyright (c) 2023 王章仲. All rights reserved.
//

#import "JWViewController.h"

@interface JWViewController ()

@end

@implementation JWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *dic = @{
        @"string"   : @"\u4f60\u4eec\u597d",
        @"array"    : @[
            @"\u674e\u767d",
            @"\u675c\u752b"
        ]
    };
    
    NSLog(@"%@", dic);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
