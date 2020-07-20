import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/empty_page.dart';


import 'base_view_model.dart';

typedef Content = Widget Function(BuildContext context);

class MultiStateWidget extends StatefulWidget {
  Widget loadingWidget;
  Widget emptyWidget;
  Widget failWidget;
  Content builder;
  final BaseState state;
  final VoidCallback callback;

  MultiStateWidget(
      {Key key,
      Content builder,
      this.state,
      this.emptyWidget,
      this.failWidget,
        this.callback,
      this.loadingWidget})
      : super(key: key) {
    if (state == BaseState.CONTENT) {
      if (builder != null) {
        this.builder = builder;
      }
    }
    if (emptyWidget == null) {
      emptyWidget = EmptyPage(EmptyPageEnum.noData,clickCallBack: callback,);
    }

    if (failWidget == null) {
      failWidget = EmptyPage(EmptyPageEnum.noNet,clickCallBack: callback,);
    }

    if (loadingWidget == null) {
      loadingWidget = LoadingWidget(
        isShow: true,
      );
    }
  }

  @override
  _MultiStateWidgetState createState() => _MultiStateWidgetState();
}

class _MultiStateWidgetState extends State<MultiStateWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.state == null) return Container();
    if (widget.state == BaseState.CONTENT) {
      return widget.builder(context);
    } else if (widget.state == BaseState.EMPTY) {
      return widget.emptyWidget;
    } else if (widget.state == BaseState.FAIL) {
      return widget.failWidget;
    } else {
      return widget.loadingWidget;
    }
  }
}

class LoadingWidget extends StatefulWidget {
  final bool isShow;

  const LoadingWidget({Key key, this.isShow}) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.isShow
        ? Container(
            color: kAppBcgColor,
            width: ScreenUtil.screenWidthDp,
            height: ScreenUtil.screenHeightDp,
            alignment: Alignment.center,
            child: CupertinoActivityIndicator(),
          )
        : Container();
  }
}
