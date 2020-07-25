import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:package_info/package_info.dart';
import 'package:rok/common/config/config.dart';
import 'package:rok/common/unils/local_storage.dart';


class HeaderInterceptors extends InterceptorsWrapper {

  static const CONTENT_TYPE_FORM = "application/json";

  @override
  onRequest(RequestOptions options) async{

    Map<String, dynamic> headers = new HashMap();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String token = await LocalStorage.get(Config.USER_TOKEN) ?? "";

    headers["app-id"] = "rok";
    headers["app-platform"] = Platform.isIOS ? "ios" : "android";
    headers["app-version"] = packageInfo.buildNumber ?? "1";
    headers["app-version-name"] = packageInfo.version ?? "v1.0.0";
    headers["app-device-id"] = "xxxxxxxxx";
    headers["app-token"] = token ?? "";
    headers["api-version"] = "1.0";
    headers["content-type"] = CONTENT_TYPE_FORM;

    options.headers = headers;
    options.connectTimeout = 30000; // 服务器链接超时，毫秒
    options.receiveTimeout = 10000; // 响应流上前后两次接受到数据的间隔，毫秒

    return options;
  }
}