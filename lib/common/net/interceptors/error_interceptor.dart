import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/config/config.dart';

///是否需要弹提示
const NOT_TIP_KEY = "noTip";

/// 网络状态拦截
class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      NavigatorUtils.showToast(Config.ERR_MSG2);
      return null;
    }
    return options;
  }
}
