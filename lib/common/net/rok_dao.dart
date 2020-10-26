import 'package:rok/common/net/api.dart';

import 'address.dart';

//获取版本更新数据

reqUserLogin(String phone, /*String smsCode,*/ String password) async {
  return await httpManager.netFetch(userLogin, {
    "phone": phone,
    "password": password,
//    "smsCode": smsCode
  });
}

reqUserInfo() async {
  return await httpManager.netFetch(userCurrentInfo, {});
}

//资产详情
assetDetail() async {
  return await httpManager.netFetch(userAssetDetail, {});
}

reqHomeData() async {
  return await httpManager.netFetch(index, null);
}

reqContractListData() async {
  return await httpManager.netFetch(contractList, null);
}

//钱包地址
walletAddress() async {
  return await httpManager.netFetch(ERC20USDTWalletAddress, {});
}

//
//提币申请预览
withdrawPreviews() async {
  return await httpManager.netFetch(withdrawPre, {});
}

//提币申请
applyWithdrawPreviews( String address,double quantity)async {
  return await httpManager.netFetch(withdrawApply, {
    "address": address,
    "quantity": quantity,
  });
}
recordList (int bizType,int pageNo,int pageSize )async {
  return await httpManager.netFetch(recordListreq, {
    "bizType": bizType,
    "pageNo": pageNo,
    "pageSize":pageSize,
  });
}