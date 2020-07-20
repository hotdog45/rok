
import 'package:rok/common/config/config.dart';

///地址数据
class Address {

  ///谊批宝 ----加网关接口---------------------------------
  ///城配首页接口
  static const String getCompanyHomeLoadHome = "company.home.loadHome";
  static const String getCheckAppUpgrade = "company.upgrade.checkAppUpgrade";

  //网关API
  static const String ROOT_GATEWAY_RELEASE =
      "https://apigw.ypshengxian.com/request"; //线上
  static const String ROOT_GATEWAY_PRE =
      "https://apigw-pre.ypshengxian.com/request"; //预发
  static const String ROOT_GATEWAY_SIT =
      "https://apigw-sit.ypshengxian.com/request"; //预发
  static const String ROOT_GATEWAY_TEST =
      "https://apigw-test.ypshengxian.com/request"; //测试
  static const String ROOT_GATEWAY_DEV =
      "https://apigw-dev.ypshengxian.com/request"; //开发

  //资源API
  static const String ROOT_RESOURCE_RELEASE =
      "https://api-resource.ypshengxian.com"; //线上
  static const String ROOT_RESOURCE_PRE =
      "https://pre-api-resource.ypshengxian.com"; //预发
  static const String ROOT_RESOURCE_SIT =
      "https://sit-api-resource.ypshengxian.com"; //sit
  static const String ROOT_RESOURCE_TEST =
      "https://test-api-resource.ypshengxian.com"; //测试
  static const String ROOT_RESOURCE_DEV = "http://172.16.4.183:8070"; //开发

  //网页
  static const String ROOT_H5BASEURL_RELEASE = "https://h5.ypshengxian.com"; //线上
  static const String ROOT_H5BASEURL_PRE = "https://pre-h5.ypshengxian.com"; //预发
  static const String ROOT_H5BASEURL_SIT = "https://sit-h5.ypshengxian.com"; //sit
  static const String ROOT_H5BASEURL_TEST = "https://test-h5.ypshengxian.com"; //测试
  static const String ROOT_H5BASEURL_DEV = "https://dev-h5.ypshengxian.com"; //开发

  //加网关API
  static getGatewayRootHostAddress(num) {
    switch (num) {
      case Config.KEY_API_HOST_RELEASE:
        return ROOT_GATEWAY_RELEASE;
      case Config.KEY_API_HOST_PRE:
        return ROOT_GATEWAY_PRE;
      case Config.KEY_API_HOST_SIT:
        return ROOT_GATEWAY_SIT;
      case Config.KEY_API_HOST_TEST:
        return ROOT_GATEWAY_TEST;
      case Config.KEY_API_HOST_DEV:
        return ROOT_GATEWAY_DEV;
      default:
        return ROOT_GATEWAY_RELEASE;
    }
  }

  //获取不同环境的网页
  static getBaseH5Url(apiNum)  {

    switch (apiNum) {
      case Config.KEY_API_HOST_RELEASE:
        return ROOT_H5BASEURL_RELEASE;
      case Config.KEY_API_HOST_PRE:
        return ROOT_H5BASEURL_PRE;
      case Config.KEY_API_HOST_SIT:
        return ROOT_H5BASEURL_SIT;
      case Config.KEY_API_HOST_TEST:
        return ROOT_H5BASEURL_TEST;
      case Config.KEY_API_HOST_DEV:
        return ROOT_H5BASEURL_DEV;
      default:
        return ROOT_H5BASEURL_RELEASE;
    }
  }
  
}
