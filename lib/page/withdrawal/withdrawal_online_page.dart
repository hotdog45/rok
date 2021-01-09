import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rok/common/model/mine/withdraw_preview_model.dart';
import 'package:rok/common/net/rok_dao.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/navigator_utils.dart';
import 'package:rok/widget/common/my_super_widget.dart';
import 'package:rok/widget/common/yp_app_bar.dart';
import 'package:rok/widget/common/yp_cached_network_Image.dart';

import 'bill_detail_list_page.dart';

class WithdrawlOnlinePage extends StatefulWidget {
  @override
  _WithdrawlOnlinePageState createState() => _WithdrawlOnlinePageState();
}

class _WithdrawlOnlinePageState extends State<WithdrawlOnlinePage> {
  withdrawPreviewModel _previewModel;
  double availableAmount = 0.00;
  final TextEditingController withdrawalController = new TextEditingController();
  final TextEditingController withdrawalControllerAddress = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _withdrawPreview();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YPAppBar("链上交易出金", actions: [
        MySuperWidget(text: "资金记录", onTap: () {
          NavigatorUtils.navigatorRouter(context, BillDetailListPage());
        }),
      ]).build(context),
      body: ListView(
        children: <Widget>[
          _previewModel==null?Container():
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  decoration: BoxDecoration(
                      color: kAppWhiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            child: Text(
                          "充值币种", //"选择充值币种"
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: fontSizeMiddle),
                        )),
                      ),
                      Expanded(
                        child: Container(),
                        flex: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            child: Text(
                          "USDT", //"USTD >"
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: fontSizeMiddle),
                        )),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 1),
                  decoration: BoxDecoration(
                      color: kAppWhiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            child: Text(
                          "链名", //"选择充值币种"
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: fontSizeMiddle),
                        )),
                      ),
                      Expanded(
                        child: Container(),
                        flex: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            child: Text(
                          "ERC20-USDT", //"USTD >"
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: fontSizeMiddle),
                        )),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 1),
                  decoration: BoxDecoration(
                      color: kAppWhiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:Container(
                            width:220,
//                            color: Colors.red,
                            margin: EdgeInsets.only(bottom: 8),
                            child: TextField(

                              controller: withdrawalControllerAddress,
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              //最大行数
                              decoration: InputDecoration.collapsed(hintText: "出金地址" ,  hintStyle: TextStyle(color: Color(0xffc3c3c3))),

                              style: TextStyle(
                                fontSize: fontSizeMiddle,
                                color: kAppTextColor,
                              ),
                              //输入文本的样式
                              onChanged:  (v){


                              },
                              onSubmitted: (text) {
                                //内容提交(按回车)的回调
//                        print('submit $text');
//                        Fluttertoast.showToast(msg: 'submit $text');
                              },
                              enabled: true,
                            )),
                      ),
                      Expanded(
                        child: Container(),
                        flex: 1,
                      ),
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              //crcode
                              child: Image.asset(
                            "static/images/qrcode.png",
                            scale: 0.5,
                          )),
                        ),
                        onTap: (){

                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: ScreenUtil.screenWidthDp,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 1),
                  padding: EdgeInsets.only(top: 20,left: 10,),
                  decoration: BoxDecoration(
                      color: kAppWhiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    "数量", //"选择充值币种"
                    style: TextStyle(
                         fontSize: fontSizeMiddle),
                  ),
                ),


                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 10, right: 10,  ),
                  decoration: BoxDecoration(
                      color: kAppWhiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1,top: 5,left: 10),
                        child: Container(
                            width:220,
                            margin: EdgeInsets.only(bottom: 8),
                            child: TextField(
                              controller: withdrawalController,
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              //最大行数
                              decoration: InputDecoration.collapsed(hintText: "最大可出数量"+_previewModel.availableBalance.toString(),  hintStyle: TextStyle(color: Color(0xffc3c3c3))),

                              style: TextStyle(
                                  fontSize: fontSizeMiddle,
                                  color: kAppTextColor,
                                   ),
                              //输入文本的样式
                               onChanged:  (v){
                                setState(() {
                                  availableAmount =  double.parse(v) -    _previewModel.fee ;
                                });

                       },
                              onSubmitted: (text) {
                                //内容提交(按回车)的回调
//                        print('submit $text');
//                        Fluttertoast.showToast(msg: 'submit $text');
                              },
                              enabled: true,
                            )),
                      ),
                      Expanded(
                        child: Container(),
                        flex: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          child: Container(
                              child: Text(
                                "全部出金", //"选择充值币种"
                                style: TextStyle(
                                    color:kAppThemeColor,
                                    fontSize: fontSizeMiddle),
                              )),

                          onTap: (){
                            withdrawalController.text = _previewModel.availableBalance.toString();
                            availableAmount = _previewModel.availableBalance-    _previewModel.fee ;
                            setState(() {

                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10, left: 20),
                  width: ScreenUtil.screenWidthDp,
                  child: Text(
                    "手续费："+_previewModel.fee.toString(),
                    style: TextStyle(
                        color: kAppSubTextColor, fontSize: fontSizeSmall),
                  ),
                ),
                availableAmount>0?
                Container(
                  margin: EdgeInsets.only(top: 3, left: 20),
                  width: ScreenUtil.screenWidthDp,
                  child: Text(
                    "实际到账数量："+availableAmount.toString(),
                    style: TextStyle(
                        color: kAppSubTextColor, fontSize: fontSizeSmall),
                  ),
                ):Container(),
                Container(
                  margin: EdgeInsets.only(top: 30, left: 20),
                  width: ScreenUtil.screenWidthDp,
                  child: Text(
                    "重要提示",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kAppPriceColor,
                        fontSize: fontSizeMiddle),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 20),
                  width: ScreenUtil.screenWidthDp,
                  child: Text(
                    "* 最小单位出金数量为："+_previewModel.minAmount.toString()+"USTD",
                    style: TextStyle(
                        color: kAppSubTextColor, fontSize: fontSizeSmall),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 3, left: 20),
                  width: ScreenUtil.screenWidthDp,
                  child: Text(
                    "* 最大单位出金数量为："+_previewModel.maxAmount.toString()+"USTD",
                    style: TextStyle(
                        color: kAppSubTextColor, fontSize: fontSizeSmall),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 3, left: 20),
                  width: ScreenUtil.screenWidthDp,
                  child: Text(
                    "* 请勿直接出金至众筹或ICO地址.我们不会处理未来代币代发放。",
                    style: TextStyle(
                        color: kAppSubTextColor, fontSize: fontSizeSmall),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 3, left: 20),
                  width: ScreenUtil.screenWidthDp,
                  child: Text(
                    "* 手续费受交易矿工费影响会产生波动，手续费会变动",
                    style: TextStyle(
                        color: kAppSubTextColor, fontSize: fontSizeSmall),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 3, left: 20),
                  width: ScreenUtil.screenWidthDp,
                  child: Text(
                    "* 实际手续费需要参考资金记录",
                    style: TextStyle(
                        color: kAppSubTextColor, fontSize: fontSizeSmall),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 3, left: 20),
                  width: ScreenUtil.screenWidthDp,
                  child: Text(
                    "* 今日剩余提币次数:"+_previewModel.times.toString(),
                    style: TextStyle(
                        color: kAppSubTextColor, fontSize: fontSizeSmall),
                  ),
                ),
                Positioned(

                  child: InkWell(
                    child: Container(
                      margin: EdgeInsets.only(top: 53),
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      width: ScreenUtil.screenWidthDp,
                      child: Center(
                        child: Text(
                          "出金",
                          style:
                              TextStyle(color: Colors.white, fontSize: fontSizeBig),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color:    _previewModel.status==1?kAppBrandBgColor:kAppSub2TextColor,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    onTap: (){
           
                          if( _previewModel.status==1){
                            _applyWithdrawPreview(withdrawalControllerAddress.text, double.parse(withdrawalController.text) );
                          }else{
                            Fluttertoast.showToast(msg: "暂停提币申请");
                          }
      


                    },

                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  void _withdrawPreview() async {
    var data = await withdrawPreviews();
    _previewModel = withdrawPreviewModel.fromJson(data);
    setState(() {});
    return;
  }

  void _applyWithdrawPreview(String address,double quantity) async {
    var data = await applyWithdrawPreviews(address,quantity);
    _previewModel = withdrawPreviewModel.fromJson(data);
    setState(() {});
    return;
  }

}
