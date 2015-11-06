//
//  CommandExec.h
//  DesignPattern
//
//  Created by zhou on 15/10/26.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"

@interface CommandExec : NSObject

@property (nonatomic,strong)id<Command> command;

-(void)performCommand;

@end
