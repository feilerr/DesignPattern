//
//  Secret.m
//  StudentLoan
//
//  Created by zhou on 15/11/13.
//  Copyright © 2015年 SHQL. All rights reserved.
//

#import "Secret.h"
#import "AA3DESManager.h"
#import <CommonCrypto/CommonCrypto.h>
#import "HttpManager.h"
#import "NSString+MD5.h"
#import "RSA.h"

static Secret *secretShare=nil;
static int uuid_success=205;
static int uuid_failure=441;

@implementation Secret

+ (Secret *) sharedInstance
{
    static dispatch_once_t secretShared;
    dispatch_once(&secretShared, ^{
        secretShare=[[self alloc]init];
    });
    return secretShare;
}

-(instancetype)init{
    self=[super init];
    if (self) {
        self.tasks=[[NSMutableArray alloc]init];
        self.params=[[NSMutableArray alloc]init];
        self.desKey=@"";
        self.uuid=@"";
        self.requestCount=0;
        self.timeout=500;
    }
    return self;
}

-(NSString *)subString:(NSString *)source length:(int)len{
    source=[source substringToIndex:len];
    return source;
}

- (NSString *)getSha256String:(NSString *)srcString{
    const char *cstr = [srcString UTF8String];
    //使用对应的CC_SHA1,CC_SHA256,CC_SHA384,CC_SHA512的长度分别是20,32,48,64
    unsigned char digest[32];
    //使用对应的CC_SHA256,CC_SHA384,CC_SHA512
    CC_SHA256(cstr,  strlen(cstr), digest);
    NSMutableString* result = [NSMutableString stringWithCapacity:32 * 2];
    for(int i = 0; i < 32; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return result;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

-(void)requestSession{
    //客户端先生成随机数num1
    if (self.uuid.length>0||self.requestCount>10) {
        return;
    }
    self.requestCount++;
    self.num1=[NSString ret32bitString];
//    [self firstPost:firstUrl params:[NSDictionary dictionaryWithObjectsAndKeys:self.num1,@"num1", nil]];
    [self FirstHttpPostSyn:_requestUrl params:[NSDictionary dictionaryWithObjectsAndKeys:self.num1,@"num1",@"uzone",@"shakehands", nil]];
}

-(NSString *)secretString:(NSString *)strs
{
    if (self.desKey.length==0) {
        self.desKey=@"abcdefghigklmnopqrstuvwkyz";
    }
    NSString *s=[AA3DESManager getEncryptWithString:strs keyString:self.desKey ivString:@"aabbccdd"];
    return s;
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

-(NSString *)dicToString:(NSDictionary*)dic{
    NSMutableString *strs=[NSMutableString stringWithString:@""];
    NSArray *keys=dic.allKeys;
    for (int i=0; i<keys.count; i++) {
        NSString *key=[keys objectAtIndex:i];
        NSString *value=[dic objectForKey:key];
        [strs appendString:[NSString stringWithFormat:@"%@=%@&",key,value]];
    }
    NSString *dicStr=[strs substringToIndex:(strs.length-1)];
    return dicStr;
}

-(void)firstPost:(NSString *)url params:(NSDictionary *)dict{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *result = [[NSString alloc] initWithData:responseObject  encoding:NSUTF8StringEncoding];
        
        NSDictionary *dic=[self dictionaryWithJsonString:result];
        currentUUID=[[dic objectForKey:@"data"] objectForKey:@"uuid"];
        NSString *num2=[[dic objectForKey:@"data"] objectForKey:@"num2"];
        int tailor=[[[dic objectForKey:@"data"] objectForKey:@"tailor"] intValue];
        int OVERDUE=[[[dic objectForKey:@"data"] objectForKey:@"OVERDUE"] intValue];
        self.num2=[self subString:num2 length:tailor];
        self.num3=[NSString ret32bitString];
        self.num1=[self subString:self.num1 length:tailor];
        self.num2=[self subString:self.num2 length:tailor];
        self.num3=[self subString:self.num3 length:tailor];
        //客户端再生成随机数 num3,并组合成3DES加密公钥 s_key
        currentDESKEY=[NSString stringWithFormat:@"%@,%@,%@",self.num1,self.num2,self.num3];
        
        //对num3进行RSA加密
        
        if (self.en_num3==nil) {
            NSLog(@"num3加密失败%@",self.num3);
            self.en_num3=@"";
        }else{
            NSLog(@"num3加密成功");
        }
        
        NSString *validation=[NSString stringWithFormat:@"%@,%@",self.num1,self.en_num3];
        validation=[self getSha256String:validation];
        
        self.en_num3=[self convert:self.en_num3];
        NSDictionary *firstHandle=[NSDictionary dictionaryWithObjectsAndKeys:self.en_num3,@"en_num3",validation,@"validation",currentUUID,@"uuid", nil];
        if (self.uuid.length>0) {
            return;
        }
        [self SecondPost:_requestUrl params:firstHandle];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}

-(void)SecondPost:(NSString *)url params:(NSDictionary *)dict{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *result = [[NSString alloc] initWithData:responseObject  encoding:NSUTF8StringEncoding];
        @try {
            NSDictionary *dic=[self dictionaryWithJsonString:result];
            if ([dic objectForKey:@"code"]!=nil) {
                int code=[[dic objectForKey:@"code"] intValue];
                if (code==uuid_success) {
                    if (self.uuid.length==0) {
                        self.uuid=currentUUID;
                        self.desKey=currentDESKEY;
                        NSLog(@"得到uuid:%@",self.uuid);
                        NSLog(@"得到3des:%@",self.desKey);
                    }
                }else{
                    NSLog(@"重新请求uuid");
                    [self requestSession];
                }
            }
        }
        @catch (NSException *exception) {
            NSLog(@"重新请求uuid");
            [self requestSession];
        }
        @finally {
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}


- (void)FirstHttpPostSyn:(NSString *)urlStr params:(NSDictionary *)dict
{
    NSURL *url = [NSURL URLWithString:urlStr];
    NSString *postStr = [self dicToString:dict];
    NSData *postData = [postStr dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *result = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    
    NSDictionary *dic=[self dictionaryWithJsonString:result];
    currentUUID=[[dic objectForKey:@"data"] objectForKey:@"uuid"];
    NSString *num2=[[dic objectForKey:@"data"] objectForKey:@"num2"];
    self.method=[[dic objectForKey:@"data"] objectForKey:@"method"];
    self.regtime=[[[dic objectForKey:@"data"] objectForKey:@"regtime"] intValue];
    self.tailor=[[[dic objectForKey:@"data"] objectForKey:@"tailor"] intValue];
    self.effecttime=[[[dic objectForKey:@"data"] objectForKey:@"effecttime"] intValue];
    self.timeout=self.effecttime-100;
    self.publicKeyString=[[dic objectForKey:@"data"] objectForKey:@"p_key"];

    self.num2=[self subString:num2 length:_tailor];
    self.num3=[NSString ret32bitString];
    self.num1=[self subString:self.num1 length:_tailor];
    self.num2=[self subString:self.num2 length:_tailor];
    self.num3=[self subString:self.num3 length:_tailor];
    //客户端再生成随机数 num3,并组合成3DES加密公钥 s_key
    currentDESKEY=[NSString stringWithFormat:@"%@,%@,%@",self.num1,self.num2,self.num3];
    
    //对num3进行RSA加密
    self.en_num3=[RSA encryptString:self.num3 publicKey:_publicKeyString];
    if (self.en_num3==nil) {
        NSLog(@"num3加密失败%@",self.num3);
        self.en_num3=@"";
    }else{
        NSLog(@"num3加密成功");
        
    }

    NSString *validation=[NSString stringWithFormat:@"%@,%@",self.num1,self.en_num3];
    validation=[self getSha256String:validation];

    self.en_num3=[self convert:self.en_num3];
    NSDictionary *firstHandle=[NSDictionary dictionaryWithObjectsAndKeys:self.en_num3,@"en_num3",validation,@"validation",currentUUID,@"uuid", nil];
    if (self.uuid.length>0) {
        return;
    }
    [self SecondHttpPostSyn:_requestUrl params:firstHandle];
    
}


-(NSString *)convert:(NSString *)text
{
   return  (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                          NULL,
                                                                          (__bridge CFStringRef)text,
                                                                          NULL,
                                                                          CFSTR("!*'();:@&=+$,/?%#[]"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
}

- (void)SecondHttpPostSyn:(NSString *)urlStr params:(NSDictionary *)dict
{
    NSURL *url = [NSURL URLWithString:urlStr];
    NSString *postStr = [self dicToString:dict];
    NSLog(@"参数字符串：%@",postStr);
    NSData *postData = [postStr dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *result = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    
//     {"status":1,"error":205,"message":"66c2c74fa58d8a1a2f32f7b8df8b338de830c9aa377277c9ea9bf25795ae7c89","data":[]}
    
    @try {
        NSDictionary *dic=[self dictionaryWithJsonString:result];
        NSString *msg=[dic objectForKey:@"msg"];
        NSString *validation=[NSString stringWithFormat:@"%@,%d,%d,%d,%@,%@",_num2,_tailor,_regtime,_effecttime,_method,_publicKeyString];
        validation=[self getSha256String:validation];
        if (![msg isEqualToString:validation]) {
            NSLog(@"验证不通过，重新申请");
            [self requestSession];
            return;
        }
        
        if ([[dic objectForKey:@"status"] intValue]==1) {
            int code=[[dic objectForKey:@"error"] intValue];
            if (code==uuid_success) {
                if (self.uuid.length==0) {
                    self.requestCount=0;
                    self.uuid=currentUUID;
                    self.desKey=currentDESKEY;
                    NSLog(@"得到uuid:%@",self.uuid);
                    NSLog(@"得到3desKey:%@",self.desKey);
                    //保持获得有效uuid的时间
                    int recordTime = [[NSDate date] timeIntervalSince1970];//1448501978,2147483647
                    [[NSUserDefaults standardUserDefaults] setInteger:recordTime forKey:kGetUUIDStartTime];
                    [[NSUserDefaults standardUserDefaults]synchronize];
                }
            }else{
                NSLog(@"重新请求uuid");
                [self requestSession];
            }
        }else{
            NSLog(@"重新请求uuid");
            [self requestSession];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"重新请求uuid");
        [self requestSession];
    }
    @finally {
        
    }
}

@end
