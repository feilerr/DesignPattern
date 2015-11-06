//
//  DeComponent.h
//  DesignPattern
//
//  Created by zhou on 15/10/23.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DeComponent <NSObject>

-(NSString *)getDescription;
-(int)compute;

@end
