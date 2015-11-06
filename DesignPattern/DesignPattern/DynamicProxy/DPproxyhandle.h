//
//  DPproxyhandle.h
//  DesignPattern
//
//  Created by zhou on 15/11/4.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPsubject.h"

typedef NS_ENUM(NSInteger,ReturnType){
    RTVoid      =0,
    RTString    =1,
    RTInt       = 2,
    RTBool      =3,
    RTNSDictory =4
};

@interface DPproxyhandle : NSObject

@property id returnValue;
@property int returnInt;
@property BOOL returnBool;
@property(nonatomic)ReturnType returnType;

-(void)invoke:(NSString *)name param:(NSMutableArray *)params;
-(void)setProxy:(NSString *)proxy;

@end
