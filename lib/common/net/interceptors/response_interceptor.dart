import 'package:dio/dio.dart';


/**
 * Token拦截器
 */
class ResponseInterceptors extends InterceptorsWrapper {

  @override
  onResponse(Response response) async{
    RequestOptions option = response.request;
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } catch (e) {
      print(e.toString() + option.path);
      return null;
    }
  }
}