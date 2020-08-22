import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomActionSheet {
  static show(BuildContext context, List data,
      {String title = '标题', Function callBack(int)}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              color: Color.fromRGBO(114, 114, 114, 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //为了防止控件溢出
                  Flexible(
                      child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
//                            new Container(
//                              height: 40,
//                              alignment: Alignment.center,
//                              child: new Text(
//                                title,
//                                textAlign: TextAlign.center,
//                              ),
//                            ),
                        Flexible(
                            child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    callBack(index);
                                  },
                                  title: Text(
                                    data[index].name + data[index].phone,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                index == data.length - 1
                                    ? Container()
                                    : Divider(
                                        height: 1,
                                        color: Color(0xFF3F3F3F),
                                      ),
                              ],
                            );
                          },
                        )),
                      ],
                    ),
                  )),
                  SizedBox(
                    height: 9,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 56,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      child: Text('取消',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17.0,
                          )),
                    ),
                    onTap: () {
                      //点击取消 弹层消失
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
