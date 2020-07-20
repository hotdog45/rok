import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

//import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:permission_handler/permission_handler.dart';

import 'navigator_utils.dart';

//保存图片工具类
class CaptureUtils {
  static Future<Uint8List> capturePng(GlobalKey globalKey) async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      return byteData.buffer.asUint8List();
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future saveImage(Uint8List imageBytes) async {
    var permission =
        PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    print("permission status is " + permission.toString());
    PermissionHandler().requestPermissions(<PermissionGroup>[
      PermissionGroup.storage, // 在这里添加需要的权限
    ]);

//    final result =
//        await ImageGallerySaver.saveImage(imageBytes); //这个是核心的保存图片的插件

    NavigatorUtils.showToast('保存成功');
  }

  static String albumName = 'Media';

  static Future capturePngAndSaveImage(GlobalKey globalKey) async {
    var permission =
        PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    print("permission status is " + permission.toString());
    PermissionHandler().requestPermissions(<PermissionGroup>[
      PermissionGroup.storage, // 在这里添加需要的权限
    ]);

    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List imageBytes = byteData.buffer.asUint8List();
//      final result =
//          await ImageGallerySaver.saveImage(imageBytes); //这个是核心的保存图片的插件

      NavigatorUtils.showToast('保存成功');
    } catch (e) {
      print(e);
    }
  }
}
