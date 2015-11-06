//
//  Observer.h
//  DesignPattern
//
//  Created by zhou on 15/10/23.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Observer <NSObject>

-(void)update:(NSString *)score;

@end
