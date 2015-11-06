//
//  WebviewTest.h
//  DesignPattern
//
//  Created by zhou on 15/10/27.
//  Copyright © 2015年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface WebviewTest : UIViewController<UIWebViewDelegate>

@property (nonatomic,strong)UIWebView *webview;
@property (nonatomic,strong)JSContext *jsContext;

@end
