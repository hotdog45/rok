import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyMethodChannel {
  static const methodChannel = MethodChannel('com.yp.flutter.method/plugin');

  static const String GET_APP_ID = "yp://flutterToNativeGetAppId";
  static const String GET_APP_Platform = "yp://flutterToNativeGetAppPlatform";
  static const String GET_TOKEN = "yp://flutterToNativeGetToken";
  static const String GET_APP_VERSION = "yp://flutterToNativeGetAppVersion";
  static const String GET_APP_VERSION_NAME =
      "yp://flutterToNativeGetAppVersionName";
  static const String GET_DEVICE_ID = "yp://flutterToNativeGetDeviceId";
  static const String GET_FLUTTER_PROXY = "yp://flutterToNativeGetFlutterProxy";

  static const String GET_CITY_CODE = "yp://flutterToNativeGetCityCode";
  static const String GET_SHOP_ID = "yp://flutterToNativeGetShopId";
  static const String GET_CART_NUM = "yp://flutterToNativeGetShoppingCartNum";
  static const String GET_PHONE_NUM = "yp://flutterToNativeGetPhoneNum";
  static const String GET_API_NUM = "yp://flutterToNativeGetAPINum";
  static const String GET_MERCHANT_SCOPE =
      "yp://flutterToNativeGetMerchantScope";
  static const String IS_TOP_VC = "yp://flutterToNativeIsTopVc";

  ///-----------------------原生-------------------------------

  //添加购物车
  static const String ADD_SHOPPING_CART = "yp://nativeAddShoppingCart";
  //提示框
  static const String SHOW_NATIVE_TOAST = "yp://nativeToast";
  //关闭页面
  static const String POP_PAGE = "yp://popPage";

  //去自提首页
  static const String GO_HOME = "yp://popPage";
  //去web活动
  static const String GO_WEB_ACTIVITY = "yp://webViewActivityPage";

  //去搜索
  static const String GO_FLUTTER_SEARCH = "yp://flutterSearch";
  //去登录
  static const String GO_LOGIN = "yp://nativeLogin";
  //去分类
  static const String GO_CATEGORY = "yp://nativeGoCategory";
  // 去购物车
  static const String GO_SHOPPING_CART_PAGE = "yp://nativeShoppingCart";
  //去商品列表页
  static const String GO_GOODS_LIST_PAGE = "yp://nativeGoodsList";
  //去H5页面
  static const String GO_WEB_PAGE = "yp://webViewPage";

  //分享
  static const String GO_APP_SHARE = "yp://appShare";

  //去商品详情页
  static const String GO_GOODS_PAGE = "yp://nativeGoodsPage";

  //去web购物车
  static const String GO_WEB_SHOPPING_CART_PAGE =
      "yp://webViewShoppingCartPage";

  //去订单页
  static const String GO_COMMIT_ORDER_VC = "yp://nativeOrderSettlementPage";

  //去订单列表页
  static const String GO_FREE_SHIP_ORDER_LIST_PAGE =
      "yp://nativeFreeShipOrderListPage";

  ///-----------------------原生 end-------------------------------

  ///-----------------------flutter-------------------------------

  //搜索页
  static const String FLUTTER_SEARCH = "yp://flutterSearch";
  //商品清单页
  static const String FLUTTER_ORDER_GOODS_PAGE = "yp://flutterOrderGoodsPage";

  //去自提首页
  static const String GO_SELF_MENTION_HOME = "yp://nativeSelfMentionHome";

  //全国包邮首页
  static const String FLUTTER_FREE_SHIPPING_PAGE =
      "yp://nativeFreeShippingPage";
  //商品详情页
  static const String FLUTTER_FREE_SHIPPING_PRODUCT_DETAIL_PAGE =
      "yp://nativeFreeShippingProductDetailPage";
  //品牌详情详情
  static const String FLUTTER_BRAND_DETAIL_PAGE = "yp://nativeBrandDetailPage";
  //包邮售后类型选择页面
  static const String FLUTTER_INIT_REFUND_ORDER_PAGE =
      "yp://flutterInitRefundOrderPage";
  //包邮售后提交页面
  static const String FLUTTER_SUBMIT_REFUND_ORDER_PAGE =
      "yp://flutterSubmitRefundOrderPage";
  //包邮售后提交成功
  static const String FLUTTER_SUBMIT_REFUND_ORDER_SUCCESS =
      "yp://flutterSubmitRefundOrderSuccess";
  //商品弹窗
  static const String FLUTTER_PRODUCT_DETAIL_DIALOG =
      "yp://flutterProductDetailDialog";
  //分享弹窗
  static const String FLUTTER_SHARE_DIALOG = "yp://flutterShareDialog";

  ///----------------------- flutter  end -------------------------------

  //测试
  static const String GO_TEST = "yp://flutterTest";
//测试通信
  static const String GO_TEST_MethodChannelPage =
      "yp://flutterMethodChannelPage";

  static Future<String> onPressCallback(String route,
      [dynamic arguments]) async {
    try {
      //回调成功
      final String callbackResult = await methodChannel.invokeMethod(route);
      return callbackResult;
    } on PlatformException catch (e) {
      //回调失败
      return "";
    }
  }

  static Future showToast(String msg) async {
    // onPressCallback(SHOW_NATIVE_TOAST + "?msg=" + msg);
    if (Platform.isIOS) {
      Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
    } else {
      Fluttertoast.showToast(msg: msg);
    }
  }
}
