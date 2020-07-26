import 'package:dio/dio.dart';
import 'package:rok/common/config/config.dart';

/// Log 拦截器
class LogsInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    if (Config.DEBUG) {
      print(
          "\n================================= 请求数据 =================================");
      print("请求数据method = ${options.method.toString()}");
      print("请求url = ${options.uri.toString()}");
      print("请求头headers = ${options.headers}");
      print("请求参数params = ${options.queryParameters}");
    }
    return options;
  }

  @override
  onResponse(Response response) async {
    if (Config.DEBUG) {
      if (response != null) {
        print(
            "\n================================= 响应数据开始 =================================");
        print("响应数据开始code = ${response.statusCode}");
        print("响应数据开始data = ${response.data}");
        print(
            "================================= 响应数据结束 =================================\n");
      }
    }
    return response; // continue
  }

  @override
  onError(DioError err) async {
    if (Config.DEBUG) {
      print(
          "\n=================================错误响应数据 =================================");
      print("请求异常:type = ${err.type}");
      print("请求异常信息:message = ${err.message}");
      print('请求异常信息: ' + err.response?.toString() ?? "");

      print("\n");
    }
    return err;
  }
}
