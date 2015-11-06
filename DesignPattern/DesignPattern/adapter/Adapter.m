//
//  Adapter.m
//  DesignPattern
//
//  Created by zhou on 15/10/27.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import "Adapter.h"

@implementation Adapter

-(void)request{
    [super specificRequest];
    NSLog(@"适配器的方法");
}

@end
