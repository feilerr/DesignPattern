//
//  IteratorImplement.m
//  DesignPattern
//
//  Created by zhou on 15/10/28.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import "IteratorImplement.h"

@implementation IteratorImplement

-(instancetype)initWithList:(NSMutableArray *)list
{
    self=[super init];
    if (self) {
        self.items=list;
    }
    return self;
}

-(BOOL)hasNext{
    if (self.items==nil||self.position>=self.items.count) {
        return NO;
    }
    return YES;
}

-(id)next{
    id obj=[self.items objectAtIndex:self.position];
    self.position=self.position+1;
    return obj;
}

@end
