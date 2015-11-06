//
//  Decorate.h
//  DesignPattern
//
//  Created by zhou on 15/10/23.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeComponent.h"
#import "Decorate.h"

@interface DecorateImplement : NSObject<Decorate>

@property (nonatomic,strong)id<DeComponent> component;

-(instancetype)initWithComponent:(id)comp;

@end
