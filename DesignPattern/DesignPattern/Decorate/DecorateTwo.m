//
//  DecorateTwo.m
//  DesignPattern
//
//  Created by zhou on 15/10/23.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import "DecorateTwo.h"

@implementation DecorateTwo


-(NSString *)getDescription{
    return [NSString stringWithFormat:@"%@,装饰者二",[self.component getDescription]];
}

-(int)compute{
    return 2+[self.component compute];
}

@end
