//
//  Base64codeFunc.h
//  DesignPattern
//
//  Created by zhou on 15/10/30.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

/******字符串转base64（包括DES加密）******/
#define __BASE64( text )        [Base64codeFunc base64StringFromText:text]

/******base64（通过DES解密）转字符串******/
#define __TEXT( base64 )        [Base64codeFunc textFromBase64String:base64]

@interface Base64codeFunc : NSObject

+ (NSString *)base64StringFromText:(NSString *)text;

+ (NSString *)textFromBase64String:(NSString *)base64;

+ (NSData *)DESEncrypt:(NSData *)data WithKey:(NSString *)key;
+ (NSData *)DESDecrypt:(NSData *)data WithKey:(NSString *)key;
+ (NSData *)dataWithBase64EncodedString:(NSString *)string;
+ (NSString *)base64EncodedStringFrom:(NSData *)data;

@end
