import 'package:rok/common/model/home/home_data.dart';
import 'package:rok/common/model/home/now_market_model.dart';
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
//行情列表
 Future<List<Contracts>> reqContractListData() async {
 var jsonStr = await httpManager.netFetch(contractList, null,useBaseModel: false);
 NowMarketBaseModel nowMarketBaseModel = NowMarketBaseModel.fromJson(jsonStr);

  return nowMarketBaseModel.data;
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


//持仓列表
reqPositionList( String contractCode)async {
  return await httpManager.netFetch(positionList, {
    "contractCode": contractCode
  });
}
//委托列表
reqEntrustList( String contractCode)async {
  return await httpManager.netFetch(entrustList, {
    "contractCode": contractCode
  });
}

recordList (int bizType,int pageNo,int pageSize )async {
  return await httpManager.netFetch(recordListreq, {
    "bizType": bizType,
    "pageNo": pageNo,
    "pageSize":pageSize,
  });
}