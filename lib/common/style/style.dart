
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';


//主题色
Color kAppThemeColor = Color(0xFFa14EFF);
//透明
Color kAppClearColor = Color(0x00ffffff);
//背景色
Color kAppBcgColor = Color(0xFFF8F8F8);
//价格
Color kAppPriceColor = Color(0xFFff4400);
//一级文字
Color kAppTextColor = Color(0xFF474245);
//二级文字
Color kAppSubTextColor = Color(0xFF969696);
//品牌页面标记
Color kAppBrandBgColor = Color(0xfff5b90b);
//白色
Color kAppWhiteColor = Color(0xFFFFFFFF);

//支付
Color kAppPayColor = Color(0xFF777777);
Color kAppColor(String hex) {
// 如果传入的十六进制颜色值不符合要求，返回默认值
  if (hex == null ||
      hex.length != 7 ||
      int.tryParse(hex.substring(1, 7), radix: 16) == null) {
    hex = '#ffffff';
  }
  return new Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
}

num kAppFontSize(num size) {
  return ScreenUtil().setWidth(size);
}




String defaultImage = 'static/images/yp_default_img.png';


class YPICons {
  static const String DEFAULT_USER_ICON = 'static/images/yp_default_img.png';
}

