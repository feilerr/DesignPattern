//
//  DPproxyhandle.m
//  DesignPattern
//
//  Created by zhou on 15/11/4.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import "DPproxyhandle.h"
#import "DPsubject.h"

@interface DPproxyhandle()
@property (nonatomic,strong)NSObject *proxyObject;
@end

@implementation DPproxyhandle

SEL ZFSelectorWithName(const char *name) {
    NSUInteger nameLength = strlen(name);
    char selector[nameLength + 1];
    memcpy(selector, name, nameLength);
    selector[nameLength] = '\0';
    return sel_registerName(selector);
}

-(void)invoke:(NSString *)name param:(NSMutableArray *)params{
    NSLog(@"代理handle");
    const char *n=[name UTF8String];
    SEL selector = ZFSelectorWithName(n);
    
    if ([self.proxyObject conformsToProtocol:@protocol(DPsubject)]) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[self.proxyObject methodSignatureForSelector:selector]];
        invocation.target = self.proxyObject;
        invocation.selector = selector;
        for (int i=2; i<(params.count+2); i++) {
            id param=[params objectAtIndex:(i-2)];
            [invocation setArgument:&param atIndex:i];
        }
        int val;
        if (self.returnType==RTVoid) {
            [invocation invoke];
            return;
        }
        if (self.returnType==RTString) {
            [invocation setReturnValue:&val];
            [invocation invoke];
            NSString *returnVal;
            [invocation getReturnValue:&returnVal];
            NSLog(@"%@",returnVal);
            self.returnValue=returnVal;
            return;
        }
        if (self.returnType==RTInt) {
            [invocation setReturnValue:&val];
            [invocation invoke];
            int returnVal;
            [invocation getReturnValue:&returnVal];
            NSLog(@"%d",returnVal);
            self.returnInt=returnVal;
            return;
        }
    }
}

-(instancetype)init{
    self=[super init];
    if (self) {
        self.returnType=RTVoid;
    }
    return self;
}

-(void)setProxy:(NSString *)proxy{
    Class someClass = NSClassFromString(proxy);
    id obj = [[someClass alloc] init];
    self.proxyObject=obj;
}

@end
