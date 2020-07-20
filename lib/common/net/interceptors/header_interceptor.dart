import 'package:dio/dio.dart';


class HeaderInterceptors extends InterceptorsWrapper {


  @override
  onRequest(RequestOptions options) async{
    ///超时
    options.connectTimeout = 35000;

    return options;
  }
}