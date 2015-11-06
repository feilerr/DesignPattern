//
//  Subject.h
//  DesignPattern
//
//  Created by zhou on 15/10/23.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol Subject <NSObject>

-(void)registerObserver:(NSObject *)observer;
-(void)removeObserver:(NSObject *)observer;
-(void)notifyObserver;

@end
