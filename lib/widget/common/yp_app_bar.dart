import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/common/unils/i18n_utils.dart';

class YPAppBar {
  final String title;
  final bool hasBackBtn;
  final bool centerTitle;
  final List<Widget> actions;
  final Widget titleWidget;

  YPAppBar(this.title,
      {this.hasBackBtn = true,
      this.centerTitle = true,
      this.titleWidget,
      this.actions});

  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      brightness: Brightness.dark,
      centerTitle: centerTitle,
      title: titleWidget ??
          Text(
            I18nUtils.translate(context, title),
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
