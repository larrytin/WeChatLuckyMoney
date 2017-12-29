# WeChatLuckyMoney
iOS上的微信抢红包, 不需越狱


## 处理流程
- [拉起微信 App](https://github.com/larrytin/WeChatLuckyMoney/blob/master/WeChatLuckyMoneyUITests/WeChatLuckyMoneyUITests.m#L22-L23)
- [阻塞主线程, 每隔 0.1 秒查询一次当前界面是否有红包来了的消息](https://github.com/larrytin/WeChatLuckyMoney/blob/master/WeChatLuckyMoneyUITests/WeChatLuckyMoneyUITests.m#L42-L48)
- [如果收到红包来了的消息, 点击消息](https://github.com/larrytin/WeChatLuckyMoney/blob/master/WeChatLuckyMoneyUITests/WeChatLuckyMoneyUITests.m#L33)
- [拆红包](https://github.com/larrytin/WeChatLuckyMoney/blob/master/WeChatLuckyMoneyUITests/WeChatLuckyMoneyUITests.m#L35-L38)