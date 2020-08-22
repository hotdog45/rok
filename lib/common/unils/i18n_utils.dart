import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
/// Copyright (C), 2015-2020, 谊品生鲜
/// FileName: i18n_utils
/// Author: lishunfeng
/// Date: 2020/7/25 8:29 PM
/// Description:
/// History:
/// <author> <time> <version> <desc>
/// 作者姓名 修改时间 版本号 描述

enum LanguageEnum { Arab, Japan, China, English, Korean, Spain, India, French }
//阿拉伯 -日本 -中国 - 英语 -韩语 -西班牙 -印度 -法语

class I18nUtils {
  //国际化翻译
  static translate(final BuildContext context, final String key) {
    return FlutterI18n.translate(context, key);
  }

  //刷新语言
  static refresh(
      final BuildContext context, final LanguageEnum languageEnum) async {
    await FlutterI18n.refresh(context, getLanguageType(languageEnum));
  }

  //获取当前语言
  static currentLocale(final BuildContext context) async {
    FlutterI18n.currentLocale(context);
  }

  //获取语言类型
  static getLanguageType(type) {
    switch (type) {
      case LanguageEnum.Arab:
        return Locale('en');
      case LanguageEnum.Japan:
        return Locale('ja');
      case LanguageEnum.China:
        return Locale('zh');
      case LanguageEnum.English:
        return Locale('en');
      case LanguageEnum.Korean:
        return Locale('ko');
      case LanguageEnum.Spain:
        return Locale('sp');
      case LanguageEnum.India:
        return Locale('in');
      case LanguageEnum.French:
        return Locale('fr');
      default:
        return Locale('en');
    }
  }

  // 语言「」内嵌变量
  static plural(
      final BuildContext context, final String key, final int pluralValue) {
    return FlutterI18n.plural(context, key, pluralValue);
  }
}
