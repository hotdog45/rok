import 'package:rok/common/config/config.dart';

///uri
const String getCompanyHomeLoadHome = "company.home.loadHome";
const String getCheckAppUpgrade = "company.upgrade.checkAppUpgrade";

///   用户模块
const String getUserRegister = "user/register";

const String userLogin = "user/login";

////////////////////////////////////////////////////////////////

///网关API
const String BASE_URL_RELEASE = "https://apigw.ypshengxian.com/request"; //线上
const String BASE_URL_DEV = "http://122.51.106.217:8001/"; //开发

///网页h5
const String BASE_URL_H5_RELEASE = "https://h5.ypshengxian.com"; //线上
const String BASE_URL_H5_DEV = "https://dev-h5.ypshengxian.com"; //开发

/// Url
getHostAddress(num) {
  switch (num) {
    case Config.KEY_API_HOST_RELEASE:
      return BASE_URL_RELEASE;
    default:
      return BASE_URL_DEV;
  }
}

/// 获取不同环境的网页
getBaseH5Url(apiNum) {
  switch (apiNum) {
    case Config.KEY_API_HOST_RELEASE:
      return BASE_URL_H5_RELEASE;
    default:
      return BASE_URL_H5_DEV;
  }
}
