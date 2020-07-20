import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rok/common/event/index.dart';
import 'package:rok/common/style/style.dart';



enum EmptyPageEnum { order, cart, noData, noNet, search, other }

class EmptyPage extends StatefulWidget {
  const EmptyPage(this.emptyPageEnum,
      {Key key,
      this.isShow = true,
      this.isShowBtn = true,
      this.title,
      this.clickCallBack,
      this.clickTitle,
      this.image})
      : super(key: key);

  final EmptyPageEnum emptyPageEnum;
  final String image;
  final bool isShow;
  final bool isShowBtn;
  final String title;
  final String clickTitle;
  final VoidCallback clickCallBack;

  @override
  _EmptyPageState createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {
  String _image;
  String _title;
  String _clickTitle;
  bool isShowBtn;
  VoidCallback _clickCallBack;
  EmptyPageEnum _emptyPageEnum;

  double _bottomPadding = 100.0;

  @override
  void initState() {
    super.initState();
    _setEmptyPageType(widget.emptyPageEnum);
    _emptyPageEnum = widget.emptyPageEnum;
    _setNetSt();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isShow
        ? Center(
            child: Container(
              color: kAppBcgColor,
              padding: EdgeInsets.only(bottom: _bottomPadding),
              child: _getEmptyWidget(context),
            ),
          )
        : Container();
  }

  Widget _getEmptyWidget(BuildContext context) {
    _setEmptyPageType(_emptyPageEnum);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(_image),
        Container(
          child: Text(
            _title,
            style: TextStyle(color: kAppSubTextColor, fontSize: 14),
          ),
          margin: EdgeInsets.only(top: 15, bottom: 15),
        ),
        widget.isShowBtn
            ? OutlineButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: _clickCallBack,
                borderSide: BorderSide(color: kAppThemeColor),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  _clickTitle,
                  style: TextStyle(fontSize: 16, color: kAppThemeColor),
                ),
              )
            : Container(),
      ],
    );
  }

  _setEmptyPageType(type) {
    switch (type) {
      case EmptyPageEnum.order:
        {
          _image = "static/images/noOrder.png";
          _title = "还没有相关订单";
          _clickTitle = "去首页逛逛";
          _clickCallBack = goHome;

        }
        break;
      case EmptyPageEnum.cart:
        {
          _image = "static/images/shop_cart_empty.png";
          _title = "购物车空空如也";
          _clickTitle = "去首页逛逛";
          _clickCallBack = goHome;
        }
        break;
      case EmptyPageEnum.noData:
        {
          _image = "static/images/empty_no_data.png";
          _title = "暂无数据";
          _clickTitle = "重新加载";
          _clickCallBack = widget.clickCallBack;
        }
        break;
      case EmptyPageEnum.search:
        {
          _image = "static/images/empty_no_data.png";
          _title = "没有找到相关商品,建议您换个关键词试试~";
          _clickTitle = "去筛选一下";
          _clickCallBack = widget.clickCallBack;
        }
        break;
      case EmptyPageEnum.noNet:
        {
          _image = "static/images/net_not.png";
          _title = "";
          _clickTitle = "重新加载";
          _clickCallBack = widget.clickCallBack;
        }
        break;
      default:
        {
          _image = widget.image;
          _title = widget.title;
          _clickTitle = widget.clickTitle;
          _clickCallBack = widget.clickCallBack;
        }
        break;
    }
    print("connecti@@@" + type.toString());
    if (mounted) {
      setState(() {});
    }
  }

  _setNetSt() {
    eventBus.on<NoNet>().listen((NoNet event) {
      if (event.notNet) {
        _emptyPageEnum = EmptyPageEnum.noNet;
        _setEmptyPageType(EmptyPageEnum.noNet);
      } else {
        _emptyPageEnum = widget.emptyPageEnum;
        _setEmptyPageType(_emptyPageEnum);
        widget.clickCallBack();
      }
    });
  }

  goHome() {
    eventBus.fire(SelTabEvent(0));
  }
}
