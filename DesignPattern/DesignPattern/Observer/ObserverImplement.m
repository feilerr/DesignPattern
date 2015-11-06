//
//  ObserverImplement.m
//  DesignPattern
//
//  Created by zhou on 15/10/23.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import "ObserverImplement.h"

@implementation ObserverImplement

-(void)update:(NSString *)score
{
    NSString *classname=[[self class]description];
    NSLog(@"观察者 %@ ：分数%@",classname,score);
}

@end
