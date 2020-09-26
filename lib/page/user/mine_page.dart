import 'package:flutter/cupertino.dart';
import 'package:rok/common/constant/app_constant.dart';
import 'package:rok/common/net/rok_dao.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/local_storage.dart';
import 'package:rok/widget/mine/account_widget.dart';
import 'package:rok/widget/mine/assets_widget.dart';
import 'package:rok/widget/mine/mine_item_widget.dart';
import 'package:rok/widget/mine/mine_third_part_widget.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  String userName = "请登录";

  @override
  void initState() {
    super.initState();

    _getUser();
    _getAvailableBalance();
  }

  _getUser() async {
//    userName = await LocalStorage.get(Config.USER_TOKEN) ?? "";
   String token = await LocalStorage.get(AppConstant.USER_TOKEN);
   if(null!=token&&token.length>1){
     userName = await LocalStorage.get(AppConstant.USER_MOBILE);
     userName = userName.substring(0,3)+"****"+ userName.substring(7,11);
     setState(() {

     });
   }else{
     userName = "请登录";
   }

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [kMineBgColor1, kMineBgColor]),
          ),
          child: Column(
            children: <Widget>[
              AccountWidget(userName: userName),
              AssetsWidget(),
              MineThirdPartWidget(),
              MineItemWidget(theme: "抵押贷款", type: 1),
              MineItemWidget(
                theme: "福利",
                type: 2,
                rightAction: "领取",
              ),
              MineItemWidget(
                theme: "卡包",
                type: 3,
              ),
              MineItemWidget(
                theme: "在线客服",
                type: 4,
              ),
              MineItemWidget(
                theme: "建议反馈",
                type: 5,
              ),
              MineItemWidget(
                theme: "了解我们",
                type: 6,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _getAvailableBalance() async {
    assetDetail()();
    return;
  }
}
