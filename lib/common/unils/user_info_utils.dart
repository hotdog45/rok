import 'package:flutter/material.dart';
import 'package:rok/common/constant/app_constant.dart';

import 'local_storage.dart';
/**
 * Copyright (C), 2015-2021, 谊品生鲜
 * FileName: user_info_utils
 * Author: lishunfeng
 * Date: 1/9/21 2:49 PM
 * Description:
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */
final UserInfoUtils userInfoUtils = UserInfoUtils();

class UserInfoUtils {
  isLogin() async{
    String token = await LocalStorage.get(AppConstant.USER_TOKEN);
    return token.isNotEmpty;
  }
  getToken() async{
    String token = await LocalStorage.get(AppConstant.USER_TOKEN) ?? "";
    return token;
  }
  setToken(String token) async {
    await LocalStorage.save(AppConstant.USER_TOKEN,token) ;
  }


}