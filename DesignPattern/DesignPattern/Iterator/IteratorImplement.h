//
//  IteratorImplement.h
//  DesignPattern
//
//  Created by zhou on 15/10/28.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Iterator.h"
#import "IteratorItem.h"

@interface IteratorImplement : NSObject<Iterator>

@property (nonatomic,strong)NSMutableArray *items;
@property int position;

-(instancetype)initWithList:(NSMutableArray *)list;

@end
