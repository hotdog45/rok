
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:launch_review/launch_review.dart';
//import 'package:r_upgrade/r_upgrade.dart';
import 'package:rok/common/model/home/app_upgrade.dart';

import 'navigator_utils.dart';



typedef updateCallBack = dynamic Function();
final DialogUtils dialogUtils = new DialogUtils();

class DialogUtils {
   void showAppUpdateDialog(
      BuildContext context, upgradeInfo, newV,isForce, updateCallBack) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("发现新版本 $newV"),
            content: Text(upgradeInfo),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  LaunchReview.launch(
                      androidAppId: "com.ypshengxian.cpdd",
                      iOSAppId: "1477030138",
                      writeReview: false);
                },
                child: Text("立即体验"),
              ),
              Visibility(
                child: FlatButton(
                  onPressed: updateCallBack,
                  child: Text("暂不更新"),
                ),
                visible: !isForce,
              ),
            ],
          );
        });
  }

//  hotfix() async{
//    int id = await RUpgrade.upgrade(
//        'https://raw.githubusercontent.com/rhymelph/r_upgrade/master/apk/app-release.apk',
//        fileName: 'app-release.apk',isAutoRequestInstall: false);
//
////    int id = await RUpgrade.getLastUpgradedId();
//    bool isSuccess = await RUpgrade.install(id);
//    if (isSuccess) {
//      NavigatorUtils.showToast("热更新成功，3s后退出应用，请重新进入");
//      Future.delayed(Duration(seconds: 3)).then((_){
//        SystemNavigator.pop(animated: true);
//      });
//    }else{
//      NavigatorUtils.showToast("热更新失败，请等待更新包下载完成");
//    }
//  }

   Future reqCheckAppUpgrade(context, updateCallBack,{bool isMine = false}) async {

//    var result = await getCheckAppUpgrade();
   return;
     var result;
    if (result) {
      AppUpgrade appUpgrade = result.data;
      if (appUpgrade.status == 2) {
        dialogUtils.showAppUpdateDialog(
            context, appUpgrade.upgradeInfo,appUpgrade.version, false, updateCallBack);
      } else if (appUpgrade.status == 3) {
        dialogUtils.showAppUpdateDialog(
            context, appUpgrade.upgradeInfo,appUpgrade.version, true, updateCallBack);
      } else {
        if(!isMine){
          if (updateCallBack !=null){
            updateCallBack();
          }
        }else{
          NavigatorUtils.showToast("已经是最新版本~");
        }

      }
    } else {
      if(!isMine){
        updateCallBack();
      }else{
        NavigatorUtils.showToast("已经是最新版本~");
      }
    }
  }

   Future<bool> showAlert(context,title,text,cancelTitle,sureTitle) {

    if (Platform.isIOS) {
      return showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text(title),
              content: Text(text),
              actions: <Widget>[
                CupertinoDialogAction(child: Text(cancelTitle),onPressed: (){
                  Navigator.of(context).pop(false);
                },),
                CupertinoDialogAction(child: Text(sureTitle),onPressed: (){
                  Navigator.of(context).pop(true);
                },),
              ],
            );
          });
    } else {
      return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: <Widget>[
              FlatButton(
                child: Text(cancelTitle),
                onPressed: () => Navigator.of(context).pop(), // 关闭对话框
              ),
              FlatButton(
                child: Text(sureTitle),
                onPressed: () {
                  //关闭对话框并返回true
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
    }
  }
}
