import 'package:fluttertoast/fluttertoast.dart';
import 'package:rok/common/constant/app_constant.dart';

import 'package:rok/common/net/api.dart';
import 'package:rok/common/unils/local_storage.dart';

import 'address.dart';

//获取版本更新数据

reqUserLogin(String phone, /*String smsCode,*/ String password) async {
  return await httpManager.netFetch(userLogin, {
    "phone": phone,
    "password": password,
//    "smsCode": smsCode
  });
}


reqUserInfo( ) async {
  return await httpManager.netFetch(userCurrentInfo, {

  });
}


assetDetail() async {
  return await httpManager.netFetch(userAssetDetail, {});
}

reqHomeData() async {
  return await httpManager.netFetch(index, null);
}

reqContractListData() async {
  return await httpManager.netFetch(contractList, null);
}
