import 'package:rok/common/constant/app_constant.dart';
import 'package:rok/common/net/address.dart';
import 'package:rok/common/net/api.dart';
import 'package:rok/common/unils/local_storage.dart';

//获取版本更新数据

reqUserLogin(String phone, /*String smsCode,*/ String password) async {
  return await httpManager.netFetch(userLogin, {
    "phone": phone,
    "password": password,
//    "smsCode": smsCode
  });
}

//userProfit

getAvailableBalance() async {
  String token = await LocalStorage.get(AppConstant.USER_TOKEN) ?? "";

  return await httpManager.netFetch(userProfit, {
    "token": token,
  });
}

reqHomeData() async {
  return await httpManager.netFetch(index, null);
}

reqContractListData() async {
  return await httpManager.netFetch(contractList, null);
}

