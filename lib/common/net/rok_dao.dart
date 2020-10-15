
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


reqUserInfo( ) async {
  return await httpManager.netFetch(userCurrentInfo, {

  });
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
//钱包地址二维码
walletAddressCodePic(String address) async {
  return await httpManager.netFetch(walletAddressCode+"?address="+address, {


  });
}
