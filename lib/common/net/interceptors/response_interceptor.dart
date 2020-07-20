import 'package:dio/dio.dart';

import '../code.dart';
import '../result_data.dart';


/**
 * Token拦截器
 */
class ResponseInterceptors extends InterceptorsWrapper {

  @override
  onResponse(Response response) async{
    RequestOptions option = response.request;
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return new ResultData(response.data, true, Code.SUCCESS);
      }
    } catch (e) {
      print(e.toString() + option.path);
      return new ResultData(response.data, false, response.statusCode);
    }
  }
}