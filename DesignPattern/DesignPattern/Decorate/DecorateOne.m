//
//  DecorateOne.m
//  DesignPattern
//
//  Created by zhou on 15/10/23.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import "DecorateOne.h"

@implementation DecorateOne


-(NSString *)getDescription{
    return [NSString stringWithFormat:@"%@,装饰者一",[self.component getDescription]];
}

-(int)compute{
    return 1+[self.component compute];
}

@end
