import 'package:rok/common/config/config.dart';

///uri
const String getCompanyHomeLoadHome = "company.home.loadHome";
const String getCheckAppUpgrade = "company.upgrade.checkAppUpgrade";

///   用户模块
const String getUserRegister = "user/register";
//登录
const String userLogin = "user/login";


//个人认证
const String userAuth = "user/auth/personal";

//用户绑银行卡、支付宝、微信收款账户
const String bindCard = "user/bind/card";

//收款账号详情
const String cardDetail= "user/card/detail";

//修改密码
const String changePassword= "user/change/password";

//获取当前登录用户信息
const String userCurrentInfo= "user/current";

//获取用户当前盈亏
const String userProfit= "user/profitloss";

//重置登录密码
const String passwordReset= "user/reset/password";

//设置交易密码
const String tradePassword = "user/setting/trade/password";


const String index = "index";



////////////////////////////////////////////////////////////////

///网关API
const String BASE_URL_RELEASE = "https://apigw.ypshengxian.com/request"; //线上
const String BASE_URL_DEV = "http://172.20.10.2:8001/"; //开发

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
