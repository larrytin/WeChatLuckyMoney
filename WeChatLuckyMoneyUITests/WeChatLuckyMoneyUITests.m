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
  UIApplication.sharedApplication.keyWindow.layer.speed = 1000;
  [UIView setAnimationsEnabled:NO];
  [super setUp];

  // Put setup code here. This method is called before the invocation of each test method in the class.

  // In UI tests it is usually best to stop immediately when a failure occurs.
  self.continueAfterFailure = YES;
  // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
  _app = [[XCUIApplication alloc] initWithBundleIdentifier:@"com.tencent.xin"];
  [_app launch];

  // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
  // Put teardown code here. This method is called after the invocation of each test method in the class.
  [super tearDown];
}

- (void)testExample {
  [_app.cells.firstMatch tap];

  XCUIElement *element = [self findRedEnvelop];
  [element tap];

  XCUIElement *button = [_app.buttons containingPredicate:[NSPredicate predicateWithFormat:@"label = %@", @"拆红包"]].element;
  if (button.exists) {
    [button tap];
  }

  NSLog(@"%@", _app.debugDescription);
}

- (XCUIElement *)findRedEnvelop {
  XCUIElement *element = [_app.cells containingPredicate:[NSPredicate predicateWithFormat:@"label CONTAINS %@", @"发来了微信红包"]].element;
  while (!element.exists) {
//    if ([NSDate timeIntervalSinceReferenceDate] - startTime > timeout) {
//      XCTFail(@"Timed out waiting for element to exist");
//      return;
//    }
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, false);
  }
  return element;
}

@end
