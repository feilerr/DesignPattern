//
//  CommandExec.m
//  DesignPattern
//
//  Created by zhou on 15/10/26.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import "CommandExec.h"

@implementation CommandExec

-(void)performCommand{
    [self.command execute];
    NSLog(@"执行到当前任务");
}

@end
