import 'package:flutter/cupertino.dart';
import 'package:rok/widget/mine/account_widget.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      AccountWidget(),

    ],);
  }
}
