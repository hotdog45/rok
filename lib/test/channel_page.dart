import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rok/common/native/method_channel.dart';
import 'package:rok/widget/common/my_super_widget.dart';
import 'package:rok/widget/common/yp_app_bar.dart';

class ChannelPage extends StatefulWidget {
  @override
  _ChannelPageState createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  Future<dynamic> platformCallHandler(MethodCall call) async {
    switch (call.method) {
      case "hh://facePath":
        // String path = call.arguments.toString();
        Fluttertoast.showToast(msg: "path--" + call.arguments.toString());
        break;
      default:
        Fluttertoast.showToast(msg: "default--" + call.arguments.toString());
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    MyMethodChannel.methodChannel
        .setMethodCallHandler(platformCallHandler); //设置监听
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: YPAppBar("测试列表").build(context),
        body: ListView(
          children: <Widget>[
            MySuperWidget(
              text: "发送消息",
              onTap: () {
                MyMethodChannel.invokeMethod(MyMethodChannel.OPEN_CAMERA_PAGE,{"id":"aabbbcccc"});

              },
              bgColor: Colors.amber,
              height: 50,
              margin: EdgeInsets.all(15),
              radius: 26,
            ),
            MySuperWidget(
              text: "发送消息2222",
              onTap: () {
                MyMethodChannel.invokeMethod(MyMethodChannel.OPEN_FACE_LIVE_PAGE,{"id":"999999999999"});
              },
              bgColor: Colors.amber,
              height: 50,
              margin: EdgeInsets.all(15),
              radius: 26,
            ),
          ],
        ));
  }
}
