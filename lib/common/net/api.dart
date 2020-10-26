import 'package:dio/dio.dart';
import 'package:dio_log/dio_log.dart';
import 'package:rok/common/model/base_model.dart';
import 'package:rok/common/unils/local_storage.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/config/config.dart';

import 'address.dart';
import 'code.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/log_interceptor.dart';
import 'interceptors/response_interceptor.dart';

///http请求
class HttpManager {
  Dio _dio = Dio(); // 使用默认配置

  HttpManager() {
    _dio.interceptors.add(HeaderInterceptors());
    _dio.interceptors.add(LogsInterceptors());
    _dio.interceptors.add(DioLogInterceptor());
    _dio.interceptors.add(ErrorInterceptors(_dio));
    _dio.interceptors.add(ResponseInterceptors());
  }

  ///发起网络请求
  ///[ url] 请求url
  ///[ params] 请求参数
  netFetch(String api, body, {noTip = false, method = "post", useBaseModel = true}) async {
    String apiNum = await LocalStorage.get(Config.KEY_API_NUM);
    resultError(DioError e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      if (!noTip) NavigatorUtils.showToast(Config.ERR_MSG2);
      return null;
    }

    resultOk(Response response) {
      if (response == null ||
          response.data == null ||
          response.data.length == 0) {
        //网络报错
        if (!noTip) NavigatorUtils.showToast(Config.ERR_MSG2);
      } else {
        BaseModel baseModel = BaseModel.fromJson(response.data);


        switch (baseModel.code) {
          case Code.INVALID_TOKEN_ERROR: //用户token失效，重写登录 ，清除用户缓存

            break;
          case Code.SUCCESS:
            if (!useBaseModel) {
              return response.data;
            }
            return baseModel.data;
          default:
            {
              if (baseModel.message != null &&
                  baseModel.message.length > 1 &&
                  !noTip) {
                NavigatorUtils.showToast(baseModel.message ?? "");
              }
            }
            break;
        }
      }
      return null;
    }

    Response response;
    try {
      response = await _dio.request(getHostAddress(apiNum) + api,
          data: body, options: Options(method: "post"));
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data);
    }
    return resultOk(response);
  }
}

final HttpManager httpManager = HttpManager();
