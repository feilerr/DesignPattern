//
//  SubjectImplement.h
//  DesignPattern
//
//  Created by zhou on 15/10/23.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Subject.h"

@interface SubjectImplement : NSObject<Subject>

@property (nonatomic,strong)NSMutableArray *observerList;

@property (nonatomic,strong)NSString *score;

@end
