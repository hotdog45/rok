import 'package:flutter/services.dart';

class MyMethodChannel {
  static const methodChannel = MethodChannel('hh://MethodChannelPlugin');

  ///----------------------- 事件路由名 -------------------------------

  //打开人脸识别页面
  static const String OPEN_FACE_LIVE_PAGE = "hh://openFaceLivePage";
  //打开视频监控页面
  static const String OPEN_CAMERA_PAGE = "hh://openCameraPage";

  ///----------------------- 事件路由名 end-------------------------------

  static Future<String> invokeMethod(String route, [dynamic arguments]) async {
    try {
      final String callbackResult =
      await methodChannel.invokeMethod(route, arguments);
      return callbackResult;
    } on PlatformException catch (e) {
      return "";
    }
  }
}
