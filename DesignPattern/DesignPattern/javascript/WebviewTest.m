//
//  WebviewTest.m
//  DesignPattern
//
//  Created by zhou on 15/10/27.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import "WebviewTest.h"

@implementation WebviewTest

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webview=[[UIWebView alloc]initWithFrame:self.view.frame];
    self.webview.delegate=self;
    NSString *resourcePath = [ [NSBundle mainBundle] resourcePath];
    NSString *filePath  = [resourcePath stringByAppendingPathComponent:@"test.html"];
    NSString *htmlstring =[[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [self.webview loadHTMLString:htmlstring  baseURL:[NSURL fileURLWithPath: [[NSBundle mainBundle]  bundlePath]]];
    [self.view addSubview:self.webview];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    if (_jsContext == nil) {
        _jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];

        _jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
            context.exception = exceptionValue;
            NSLog(@"异常信息：%@", exceptionValue);
        };
        
        _jsContext[@"activityList"] = ^(NSDictionary *param) {
            NSLog(@"哈哈：%@", param);
        };
        
        // Mozilla/5.0 (iPhone; CPU iPhone OS 10_10 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B411
        id userAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
        NSLog(@"%@", userAgent);
    }  
}

@end
