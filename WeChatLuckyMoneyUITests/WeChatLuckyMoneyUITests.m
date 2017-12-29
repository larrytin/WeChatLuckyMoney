//
//  WeChatLuckyMoneyUITests.m
//  WeChatLuckyMoneyUITests
//
//  Created by Larry Tin on 2017/12/27.
//  Copyright © 2017 Goodow. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface WeChatLuckyMoneyUITests : XCTestCase
@property(nonatomic, strong) XCUIApplication *app;

@end

@implementation WeChatLuckyMoneyUITests

- (void)setUp {
  [super setUp];

  self.continueAfterFailure = YES;
  _app = [[XCUIApplication alloc] initWithBundleIdentifier:@"com.tencent.xin"];
  [_app launch]; // 拉起微信 App

}

- (void)tearDown {
  [super tearDown];
}

- (void)testExample {
  XCUIElement *element = [self waitUntilRedEnvelopExists]; // 等待红包出现
  [element tap]; // 点击红包消息

  XCUIElement *button = [_app.buttons containingPredicate:[NSPredicate predicateWithFormat:@"label = %@", @"拆红包"]].element;
  if (button.exists) {
    [button tap]; // 开红包
  }
  
}

- (XCUIElement *)waitUntilRedEnvelopExists {
  XCUIElement *element = [self findRedEnvelop];
  while (!element.exists) {
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, false); // 阻塞主线程, 每隔 0.1 秒检测一次
  }
  return element;
}

/**
 * 查询红包消息
 * @return
 */
- (XCUIElement *)findRedEnvelop {
  return [_app.cells containingPredicate:[NSPredicate predicateWithFormat:@"label CONTAINS %@", @"发来了微信红包"]].firstMatch;
}

@end
