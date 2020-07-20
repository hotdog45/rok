import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyBasicMessageChannel {
//初始化BasicMessageChannel
  static const BasicMessageChannel<String> basicMessageChannel =
      BasicMessageChannel("yp://BasicMessageChannelPlugin", StringCodec());

  ///----------------------事件名称 -------------------------------

  //登录成功回调
  static const String NATIVE_LOGIN_SUCCESS = "yp://native_login_success";

  ///-----------------------事件名称 end-------------------------------
  

  // 接受消息
  static void handleBasicMessageChannel() {
    basicMessageChannel
        .setMessageHandler((String message) => Future<String>(() {

      if (message.startsWith(NATIVE_LOGIN_SUCCESS)) {

              } else {
                return "收到Native的消息：接受成功";
              }
              return "";
            }));
  }

  static Future<String> sendMessage(msg) async {
    //发送消息
    var response = await basicMessageChannel.send(msg);
   
    return response;
  }
}
