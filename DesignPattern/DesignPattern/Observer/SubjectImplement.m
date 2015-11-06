//
//  SubjectImplement.m
//  DesignPattern
//
//  Created by zhou on 15/10/23.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import "SubjectImplement.h"
#import "Subject.h"
#import "Observer.h"

@implementation SubjectImplement

-(instancetype)init
{
    self=[super init];
    if (self) {
        self.observerList=[[NSMutableArray alloc]init];
    }
    return self;
}

-(void)registerObserver:(NSObject *)observer{
    [self.observerList addObject:observer];
}

-(void)removeObserver:(NSObject *)observer{
    if (self.observerList.count>0) {
        [self.observerList removeObject:observer];
    }
}

-(void)notifyObserver{

    for (int i=0; i<self.observerList.count; i++) {
        NSObject *observer=[self.observerList objectAtIndex:i];
        if ([observer conformsToProtocol:@protocol(Observer)]) {
            if ([observer respondsToSelector:@selector(update:)]){
                [observer performSelector:@selector(update:) withObject:self.score];
            }
        }
    }
}

@end
