import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rok/common/style/style.dart';

class YPAppBar {
  final String title;
  final bool hasBackBtn;
  final List<Widget> actions;

  YPAppBar(this.title,{ this.hasBackBtn = true, this.actions});

  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      centerTitle: true,
      title:  Text(
        title,
        style: TextStyle(color: kAppTextColor, fontSize: 17),
      ),
      automaticallyImplyLeading: hasBackBtn,
      leading: hasBackBtn
          ? IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: SizedBox(
            height: 18,
            width: 18,
            child: Image.asset("static/images/nav_back_arrow.png"),
          ),
          onPressed: () {
            Navigator.pop(context);
          })
          : Container(),
      actions: actions,
    );
  }
}
