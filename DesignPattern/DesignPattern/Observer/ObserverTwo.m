//
//  ObserverTwo.m
//  DesignPattern
//
//  Created by zhou on 15/10/23.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import "ObserverTwo.h"

@implementation ObserverTwo

-(void)update:(NSString *)score
{
    [super update:score];
    NSLog(@"观察者 2 ：我自己的分数");
}

@end
