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
  [_app launch];

}

- (void)tearDown {
  [super tearDown];
}

- (void)testExample {
  XCUIElement *element = [self waitUntilRedEnvelopExists];
  [element tap];

  XCUIElement *button = [_app.buttons containingPredicate:[NSPredicate predicateWithFormat:@"label = %@", @"拆红包"]].element;
  if (button.exists) {
    [button tap];
  }
  
}

- (XCUIElement *)waitUntilRedEnvelopExists {
  XCUIElement *element = [self findRedEnvelop];
  while (!element.exists) {
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, false);
  }
  return element;
}

- (XCUIElement *)findRedEnvelop {
  return [_app.cells containingPredicate:[NSPredicate predicateWithFormat:@"label CONTAINS %@", @"发来了微信红包"]].element;
}

@end
