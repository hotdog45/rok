import 'package:rok/config/config.dart';

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
const String cardDetail = "user/card/detail";

//修改密码
const String changePassword = "user/change/password";

//获取当前登录用户信息
const String userCurrentInfo = "user/current";

//重置登录密码
const String passwordReset = "user/reset/password";

//设置交易密码
const String tradePassword = "user/setting/trade/password";

//首页
const String index = "index";

//行情
const String contractList = "contract/list";

//资产详情
const String userAssetDetail = "asset/detail";

//查询当前用户对应的ERC20-USDT钱包地址
const String ERC20USDTWalletAddress = "user/wallet/address";

//钱包地址二维码
const String walletAddressCode = "qrcode/wallet";

//提币申请预览
const String withdrawPre = "asset/withdraw/preview";

//提币申请预览
const String withdrawApply = "asset/withdraw";

//提币申请预览
const String recordListreq = "asset/record/list";

//持仓列表
const String positionList = "position/list";
//委托列表
const String entrustList = "entrust/list";

//收益计算
const String profitCalculation = "calc/profit";

const String tradeOpen = "trade/open";

const String entrustHistoryList = "entrust/history/list";


////////////////////////////////////////////////////////////////

///网关API
const String BASE_URL_RELEASE = "http://g3zi8sd.nat.ipyingshe.com/"; //线上
const String BASE_URL_DEV = "http://g3zi8sd.nat.ipyingshe.com/"; //开发
///WebSocket
const String BASE_WEB_SOCKET_RELEASE = "ws://z7ih7p4.nat.ipyingshe.com"; //线上
const String BASE_WEB_SOCKET_DEV = "ws://z7ih7p4.nat.ipyingshe.com"; //开发
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

getWebSocketAddress(num) {
  switch (num) {
    case Config.KEY_API_HOST_RELEASE:
      return BASE_WEB_SOCKET_RELEASE;
    default:
      return BASE_WEB_SOCKET_DEV;
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
