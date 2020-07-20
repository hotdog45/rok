import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:rok/common/unils/navigator_utils.dart';

import '../code.dart';
import '../result_data.dart';


///是否需要弹提示
const NOT_TIP_KEY = "noTip";

/**
 * 错误拦截
 */
class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {
    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      NavigatorUtils.showToast("网络错误，请稍后重试~");
      return ;
//      return _dio.resolve(null);

    }
    return options;
  }
}
