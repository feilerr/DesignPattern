//
//  Decorate.m
//  DesignPattern
//
//  Created by zhou on 15/10/23.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import "DecorateImplement.h"

@implementation DecorateImplement

-(instancetype)initWithComponent:(id)comp
{
    self=[super init];
    if (self) {
        self.component=comp;
    }
    return self;
}

-(NSString *)getDescription{
    return @"";
}
-(int)compute;
{
    return 0;
}

@end
