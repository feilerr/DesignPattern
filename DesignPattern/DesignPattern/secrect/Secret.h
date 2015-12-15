//
//  Secret.h
//  StudentLoan
//
//  Created by zhou on 15/11/13.
//  Copyright © 2015年 SHQL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "config.h"

@protocol SecretProtocol <NSObject>

@required
-(void)invokeTask;//调用真实的方法,0为get,1为post

@end

@interface Secret : NSObject{
    NSString *currentUUID;
    NSString *currentDESKEY;
    
}

@property (nonatomic,strong)NSString *requestUrl;

@property (nonatomic) id<SecretProtocol> secretDelegate;
@property (nonatomic,strong)NSString *uuid;
@property (nonatomic,strong)NSString *num1;//第一个随机数
@property (nonatomic,strong)NSString *num2;//第二个随机数
@property (nonatomic,strong)NSString *num3;//第三个随机数
@property (nonatomic,strong)NSString *desKey;
@property (nonatomic,strong)NSString *en_username;
@property (nonatomic,strong)NSMutableArray *tasks;//点击
@property (nonatomic,strong)NSMutableArray *params;//点击
@property (nonatomic,strong)NSString *en_num3;
@property (nonatomic,assign)int requestCount;//最大连续请求次数10次
@property (nonatomic,assign)int timeout;//过期最大时间
@property (nonatomic,assign)int effecttime;//有效时间
@property (nonatomic,strong)NSString *method;//方法
@property (nonatomic,assign)int regtime;//注册时间
@property (nonatomic,assign)int tailor;//截取长度
@property (nonatomic,strong)NSString *publicKeyString;//RSA加密公钥

+ (Secret *) sharedInstance;
-(void)requestSession;
-(NSString *)secretString:(NSString *)strs;

@end


