//
//  RSAEncrypt.h
//  DesignPattern
//
//  Created by zhou on 15/10/30.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

@interface RSAEncrypt : NSObject{
    SecKeyRef publicKey;
    SecCertificateRef certificate;
    SecPolicyRef policy;
    SecTrustRef trust;
    size_t maxPlainLen;
}
- (NSData *)encryptWithData:(NSData *)content;
- (NSData *)encryptWithString:(NSString *)content;
- (NSString *)encryptToString:(NSString *)content;

// return base64 encoded string
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;
+ (NSData *)encryptData:(NSData *)data publicKey:(NSString *)pubKey;
+ (NSString *)decryptString:(NSString *)str publicKey:(NSString *)pubKey;
+ (NSData *)decryptData:(NSData *)data publicKey:(NSString *)pubKey;
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;
+ (NSData *)decryptData:(NSData *)data privateKey:(NSString *)privKey;

@end
