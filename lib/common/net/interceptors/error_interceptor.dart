import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:rok/common/config/config.dart';
import 'package:rok/common/unils/navigator_utils.dart';


///是否需要弹提示
const NOT_TIP_KEY = "noTip";

/**
 * 网络状态拦截
 */
class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      NavigatorUtils.showToast(Config.ERR_MSG2);
      return null;
    }
    return options;
  }
}
