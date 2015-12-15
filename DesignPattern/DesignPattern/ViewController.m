//
//  ViewController.m
//  DesignPattern
//
//  Created by zhou on 15/10/23.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import "ViewController.h"
#import "SubjectImplement.h"
#import "ObserverOne.h"
#import "ObserverTwo.h"
#import "DeComponent.h"
#import "ComponentOne.h"
#import "DecorateOne.h"
#import "DecorateTwo.h"
#import "CommandExec.h"
#import "CommandImplement.h"
#import "CommonTarget.h"
#import "Adapter.h"
#import "IteratorImplement.h"
#import "IteratorItem.h"
#import "Base64codeFunc.h"
#import "RSAEncrypt.h"
#import "RSA.h"
#import "WebviewTest.h"
#import "RSAEncryptor.h"
#import "DPproxyhandle.h"
#import "DPrealsubject.h"
#import "DPsubject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, 45)];
    btn.backgroundColor=[UIColor grayColor];
    [btn addTarget:self action:@selector(toWebview) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    // Do any additional setup after loading the view, typically from a nib.
    //观察者
//    SubjectImplement *subject=[[SubjectImplement alloc]init];
//    subject.score=@"1";
//    ObserverImplement *one=[[ObserverOne alloc]init];
//    ObserverImplement *two=[[ObserverTwo alloc]init];
//    [subject registerObserver:one];
//    [subject notifyObserver];
//    subject.score=@"2";
//    [subject registerObserver:two];
//    [subject notifyObserver];
//    subject.score=@"3";
//    [subject removeObserver:one];
//    [subject notifyObserver];
    
    //装饰者
//    id<DeComponent> one=[[ComponentOne alloc]init];
//    one=[[DecorateOne alloc]initWithComponent:one];
//    NSLog(@"%@",[one getDescription]);
//    NSLog(@"%d",[one compute]);
//    one=[[DecorateTwo alloc]initWithComponent:one];
//    NSLog(@"%@",[one getDescription]);
//    NSLog(@"%d",[one compute]);
    
    //命令者
//    CommandExec *commandExec=[[CommandExec alloc]init];
//    id<Command> command1=[[CommandImplement alloc]init];
//    commandExec.command=command1;
//    [commandExec performCommand];
    
    //适配器
//    id<AdapterTarget> obj=[[CommonTarget alloc]init];
//    [obj request];
//    obj=[[Adapter alloc]init];
//    [obj request];
    
    //迭代器模式
//    NSMutableArray *list=[[NSMutableArray alloc]init];
//    IteratorItem *item1=[[IteratorItem alloc]init];
//    item1.name=@"对象一";
//    [list addObject:item1];
//    IteratorItem *item2=[[IteratorItem alloc]init];
//    item2.name=@"对象二";
//    [list addObject:item2];
//    id<Iterator> objs=[[IteratorImplement alloc]initWithList:list];
//    while ([objs hasNext]) {
//        IteratorItem *item=[objs next];
//        NSLog(@"输出对象：%@",item.name);
//    }
    
    //动态代理
//    DPproxyhandle *handle=[[DPproxyhandle alloc]init];
//    handle.returnType=RTInt;
//    [handle setProxy:@"DPrealsubject"];
//    [handle invoke:@"doSomething" param:nil];
//    if (handle.returnInt==10) {
//        NSLog(@"获得值");
//    }
    
    //DES加密解密
//    NSString *key = @"111111111111111";
    NSString *str=@"Your HEX modulus here";
//    NSData *data=[str dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *enData=[Base64codeFunc DESEncrypt:data WithKey:key];
//    NSString *enString=[Base64codeFunc base64EncodedStringFrom:enData];
//    NSLog(@"加密后数据：%@",enString);
//    NSData *deData=[Base64codeFunc dataWithBase64EncodedString:enString];
//    NSData *deData2=[Base64codeFunc DESDecrypt:deData WithKey:key];
//    NSString *deString=[[NSString alloc]initWithData:deData2 encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",deString);
    
    //RSA加密解密
//    RSAEncrypt *rsa = [[RSAEncrypt alloc] init];
//    NSData *tData=[str dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *RSAdata=[rsa encryptWithData:tData];
//    NSString *RSAenString=[Base64codeFunc base64EncodedStringFrom:RSAdata];
//    NSLog(@"加密后数据：%@",RSAenString);
//
//    NSData *data2=[Base64codeFunc dataWithBase64EncodedString:RSAenString];
//    NSString *rsaString=[rsa encryptToString:RSAenString];
//    NSLog(@"解密后：%@",rsaString);
    
    //Sc8kkhm69V1yXSrIwO8VY5/bg7oB5SjsbIVicyTdY3nIEWlovEKsnPCyzAgPduiyBh+G63G/p0Snyp85yrTyj6gZMGyGtAq/pcLfavQOaOziReQDEA2ZRNh2Z9FHJp1C4iQwc4waOfyAe/vQeD03lHaxCVDZiOnBUEmmawqtyXA=
    
//    gg8BuhF4fiCn2daW69ornlyJNC6WprbjKMDrHigABjt/oK2jOzW51NoPdkfy5qM1l4QnOE6U4iQWjEBNXjqXxWwsgIj+eBWqtfSeUhTGSdUDkI0J74CbUl0cOV74dNMb+lmyM+KIDRKch7cNwI6dWDIO40bWljZ+jvLbwx63FCw=
    
//    [self RSA];

//    [self RSA:@"123456" key:publicCode];
    
//    RSAEncrypt *encryt=[[RSAEncrypt alloc]init];
//    NSString *encodeStr=[encryt encryptToString:publicKey];
//    NSLog(@"%@",encodeStr);
//    NSString *decodeStr=[RSAEncrypt decryptString:encodeStr privateKey:privateKey];
//    NSLog(@"%@",decodeStr);
    
    
//    NSString *publickey=@"-----BEGIN PUBLIC KEY-----MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCfRTdcPIH10gT9f31rQuIInLwe
//    7fl2dtEJ93gTmjE9c2H+kLVENWgECiJVQ5sonQNfwToMKdO0b3Olf4pgBKeLThra
//    z/L3nYJYlbqjHC3jTjUnZc0luumpXGsox62+PuSGBlfb8zJO6hix4GV/vhyQVCpG
//    9aYqgE7zyTRZYX9byQIDAQAB
//    -----END PUBLIC KEY-----"
    
    [self RSA2];
    
}

-(void)post:(NSString *)bodyString url:(NSString *)RequestUrl
{
//    NSData *bodyData = [[bodyString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]dataUsingEncoding:NSUTF8StringEncoding];//把bodyString转换为NSData数据
//    NSURL *serverUrl = [[NSURL URLWithString:RequestUrl] URLByAppendingPathComponent:urlStr];//获取到服务器的url地址
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:serverUrl
//                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
//                                                       timeoutInterval:10];//请求这个地址， timeoutInterval:10 设置为10s超时：请求时间超过10s会被认为连接不上，连接超时
//    
//    [request setHTTPMethod:@"POST"];//POST请求
//    [request setHTTPBody:bodyData];//body 数据
//    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];//请求头
//    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];//同步发送request，成功后会得到服务器返回的数据
    //返回的数据 根据系统的不同会返回不同编码的数据，比如windows 为GBK，Ubuntu 为UTF8.。。
    //注意转换编码格式
}

-(void)RSA:(NSString *)str key:(NSString *)publicKey
{
    RSAEncryptor *rsaEncryptor = [[RSAEncryptor alloc] init];
    [rsaEncryptor loadPublicKeyFromString: publicKey];
    NSString* restrinBASE64STRING = [rsaEncryptor rsaEncryptString:str];
    NSLog(@"Encrypted: %@", restrinBASE64STRING);
    
    NSURL *URL=[NSURL URLWithString:@"http://192.168.1.97/u_zone_app_api/encryption/step1.php"];//不需要传递参数
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:URL];//默认为get请求
    request.timeoutInterval=15.0;
    request.HTTPMethod=@"get";
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *result = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
}

-(void)RSA
{
    NSString *m= @"Your are here";
    
    RSAEncryptor *rsaEncryptor = [[RSAEncryptor alloc] init];
    NSString *publicKeyPath = [[NSBundle mainBundle] pathForResource:@"public_key" ofType:@"pem"];
//    -----BEGIN PUBLIC KEY-----
//    MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCfRTdcPIH10gT9f31rQuIInLwe
//    7fl2dtEJ93gTmjE9c2H+kLVENWgECiJVQ5sonQNfwToMKdO0b3Olf4pgBKeLThra
//    z/L3nYJYlbqjHC3jTjUnZc0luumpXGsox62+PuSGBlfb8zJO6hix4GV/vhyQVCpG
//    9aYqgE7zyTRZYX9byQIDAQAB
//    -----END PUBLIC KEY-----
    NSString *privateKeyPath = [[NSBundle mainBundle] pathForResource:@"private_key" ofType:@"p12"];
//    -----BEGIN PRIVATE KEY-----
//    MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAJ9FN1w8gfXSBP1/
//    fWtC4gicvB7t+XZ20Qn3eBOaMT1zYf6QtUQ1aAQKIlVDmyidA1/BOgwp07Rvc6V/
//    imAEp4tOGtrP8vedgliVuqMcLeNONSdlzSW66alcayjHrb4+5IYGV9vzMk7qGLHg
//    ZX++HJBUKkb1piqATvPJNFlhf1vJAgMBAAECgYA736xhG0oL3EkN9yhx8zG/5RP/
//    WJzoQOByq7pTPCr4m/Ch30qVerJAmoKvpPumN+h1zdEBk5PHiAJkm96sG/PTndEf
//    kZrAJ2hwSBqptcABYk6ED70gRTQ1S53tyQXIOSjRBcugY/21qeswS3nMyq3xDEPK
//    XpdyKPeaTyuK86AEkQJBAM1M7p1lfzEKjNw17SDMLnca/8pBcA0EEcyvtaQpRvaL
//    n61eQQnnPdpvHamkRBcOvgCAkfwa1uboru0QdXii/gUCQQDGmkP+KJPX9JVCrbRt
//    7wKyIemyNM+J6y1ZBZ2bVCf9jacCQaSkIWnIR1S9UM+1CFE30So2CA0CfCDmQy+y
//    7A31AkB8cGFB7j+GTkrLP7SX6KtRboAU7E0q1oijdO24r3xf/Imw4Cy0AAIx4KAu
//    L29GOp1YWJYkJXCVTfyZnRxXHxSxAkEAvO0zkSv4uI8rDmtAIPQllF8+eRBT/deD
//    JBR7ga/k+wctwK/Bd4Fxp9xzeETP0l8/I+IOTagK+Dos8d8oGQUFoQJBAI4Nwpfo
//    MFaLJXGY9ok45wXrcqkJgM+SN6i8hQeujXESVHYatAIL/1DgLi+u46EFD69fw0w+
//    c7o0HLlMsYPAzJw=
//    -----END PRIVATE KEY-----
    
    [rsaEncryptor loadPublicKeyFromFile: publicKeyPath];
    NSString* restrinBASE64STRING = [rsaEncryptor rsaEncryptString:m];
    NSLog(@"Encrypted: %@", restrinBASE64STRING);
    
    [rsaEncryptor loadPrivateKeyFromFile: privateKeyPath password:@""];
    NSString* decryptString = [rsaEncryptor rsaDecryptString: restrinBASE64STRING];
    NSLog(@"Decrypted: %@", decryptString);
}

-(void)RSA2
{
//    NSString *publicKey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDEChqe80lJLTTkJD3X3Lyd7Fj+\nzuOhDZkjuLNPog3YR20e5JcrdqI9IFzNbACY/GQVhbnbvBqYgyql8DfPCGXpn0+X\nNSxELIUw9Vh32QuhGNr3/TBpechrVeVpFPLwyaYNEk1CawgHCeQqf5uaqiaoBDOT\nqeox88Lc1ld7MsfggQIDAQAB\n-----END PUBLIC KEY-----";
//    NSString *privateKey = @"-----BEGIN RSA PRIVATE KEY-----\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMQKGp7zSUktNOQk\nPdfcvJ3sWP7O46ENmSO4s0+iDdhHbR7klyt2oj0gXM1sAJj8ZBWFudu8GpiDKqXw\nN88IZemfT5c1LEQshTD1WHfZC6EY2vf9MGl5yGtV5WkU8vDJpg0STUJrCAcJ5Cp/\nm5qqJqgEM5Op6jHzwtzWV3syx+CBAgMBAAECgYEApSzqPzE3d3uqi+tpXB71oY5J\ncfB55PIjLPDrzFX7mlacP6JVKN7dVemVp9OvMTe/UE8LSXRVaFlkLsqXC07FJjhu\nwFXHPdnUf5sanLLdnzt3Mc8vMgUamGJl+er0wdzxM1kPTh0Tmq+DSlu5TlopAHd5\nIqF3DYiORIen3xIwp0ECQQDj6GFaXWzWAu5oUq6j1msTRV3mRZnx8Amxt1ssYM0+\nJLf6QYmpkGFqiQOhHkMgVUwRFqJC8A9EVR1eqabcBXbpAkEA3DQfLVr94vsIWL6+\nVrFcPJW9Xk28CNY6Xnvkin815o2Q0JUHIIIod1eVKCiYDUzZAYAsW0gefJ49sJ4Y\niRJN2QJAKuxeQX2s/NWKfz1rRNIiUnvTBoZ/SvCxcrYcxsvoe9bAi7KCMdxObJkn\nhNXFQLav39wKbV73ESCSqnx7P58L2QJABmhR2+0A5EDvvj1WpokkqPKmfv7+ELfD\nHQq33LvU4q+N3jPn8C85ZDedNHzx57kru1pyb/mKQZANNX10M1DgCQJBAMKn0lEx\nQH2GrkjeWgGVpPZkp0YC+ztNjaUMJmY5g0INUlDgqTWFNftxe8ROvt7JtUvlgtKC\nXdXQrKaEnpebeUQ=\n-----END RSA PRIVATE KEY-----";
    NSString *publicKey=@"-----BEGIN PUBLIC KEY-----MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCfRTdcPIH10gT9f31rQuIInLwe7fl2dtEJ93gTmjE9c2H+kLVENWgECiJVQ5sonQNfwToMKdO0b3Olf4pgBKeLThraz/L3nYJYlbqjHC3jTjUnZc0luumpXGsox62+PuSGBlfb8zJO6hix4GV/vhyQVCpG9aYqgE7zyTRZYX9byQIDAQAB-----END PUBLIC KEY-----";
    
    NSString *privateKey = @"-----BEGIN PRIVATE KEY-----MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAJ9FN1w8gfXSBP1/fWtC4gicvB7t+XZ20Qn3eBOaMT1zYf6QtUQ1aAQKIlVDmyidA1/BOgwp07Rvc6V/imAEp4tOGtrP8vedgliVuqMcLeNONSdlzSW66alcayjHrb4+5IYGV9vzMk7qGLHgZX++HJBUKkb1piqATvPJNFlhf1vJAgMBAAECgYA736xhG0oL3EkN9yhx8zG/5RP/WJzoQOByq7pTPCr4m/Ch30qVerJAmoKvpPumN+h1zdEBk5PHiAJkm96sG/PTndEfkZrAJ2hwSBqptcABYk6ED70gRTQ1S53tyQXIOSjRBcugY/21qeswS3nMyq3xDEPKXpdyKPeaTyuK86AEkQJBAM1M7p1lfzEKjNw17SDMLnca/8pBcA0EEcyvtaQpRvaLn61eQQnnPdpvHamkRBcOvgCAkfwa1uboru0QdXii/gUCQQDGmkP+KJPX9JVCrbRt7wKyIemyNM+J6y1ZBZ2bVCf9jacCQaSkIWnIR1S9UM+1CFE30So2CA0CfCDmQy+y7A31AkB8cGFB7j+GTkrLP7SX6KtRboAU7E0q1oijdO24r3xf/Imw4Cy0AAIx4KAuL29GOp1YWJYkJXCVTfyZnRxXHxSxAkEAvO0zkSv4uI8rDmtAIPQllF8+eRBT/deDJBR7ga/k+wctwK/Bd4Fxp9xzeETP0l8/I+IOTagK+Dos8d8oGQUFoQJBAI4NwpfoMFaLJXGY9ok45wXrcqkJgM+SN6i8hQeujXESVHYatAIL/1DgLi+u46EFD69fw0w+c7o0HLlMsYPAzJw=-----END PRIVATE KEY-----";

    
    NSString *originString = @"11111111";
    NSString *encWithPubKey;
    NSString *decWithPrivKey;
    NSString *encWithPrivKey;
    NSString *decWithPublicKey;
    
    NSLog(@"Original string: %@", originString);
    
    // Demo: encrypt with public key
    encWithPubKey = [RSA encryptString:originString publicKey:publicKey];
    NSLog(@"公钥加密: %@", encWithPubKey);
    // Demo: decrypt with private key
    decWithPrivKey = [RSA decryptString:encWithPubKey privateKey:privateKey];
    NSLog(@"私钥解密: %@", decWithPrivKey);
    
//    dRFbA2tvTmj4ompjBtmAnR3yWo+8WahP1ayRysg1hfEF90aFEOlrsU20pfixbmPb3n+2TxsQ98TEE1zYkh4zi+CuyYAkIkwWouM4Rjn7pzFCJdsKEYIwiqV/5ZFE7wiA3DUjwcukbRJ0b0e76EcCl9WGLK9Ca9KHnXP7/ANQrBM=
//    Cipher text: dRFbA2tvTmj4ompjBtmAnR3yWo+8WahP1ayRysg1hfEF90aFEOlrsU20pfixbmPb3n+2TxsQ98TEE1zYkh4zi+CuyYAkIkwWouM4Rjn7pzFCJdsKEYIwiqV/5ZFE7wiA3DUjwcukbRJ0b0e76EcCl9WGLK9Ca9KHnXP7/ANQrBM=
    
//    // by PHP
//    encWithPubKey = @"p1i8zlbzjy9e8PI0hsmVZUNLNy0jr7KpbsDoKek1FvHpnPXkk1W+91mizj6aD+7n7UkE2G5OrrmqaQSQzMEXOv+zgyGQH0x1AlbCYg0YAFdoOiOOUuNS4Gb9ltFmjy9pGf5mqCcr33h14Ln3l5MZGylyoSmIDpooDCk2t/BJHnU=";
//    decWithPrivKey = [RSA decryptString:encWithPubKey privateKey:privateKey];
//    NSLog(@"(PHP enc)Decrypted with private key: %@", decWithPrivKey);
//    
//    // Demo: decrypt with public key
//    encWithPrivKey = @"F+feHOH6807tUV/drvepAMzKlVKRsoDFRkFNfhS9kgVoBt2E6OnUIVw12l608yQGWiqtq8rgZgMY/VCQYZB+3r2rhDlyZ2fjo00sUFOp5BkNPFTs/NpQAolD6V3ifNgDmBQP92uVbxbod1pLRwLC0wLOhr5flQXvvobeg5KrDeE=";
//    decWithPublicKey = [RSA decryptString:encWithPrivKey publicKey:publicKey];
//    NSLog(@"(PHP enc)Decrypted with public key: %@", decWithPublicKey);
}

-(void)toWebview{
    WebviewTest *controller=[[WebviewTest alloc]init];
    UINavigationController *navi=self.navigationController;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
