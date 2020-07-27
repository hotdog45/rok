import 'package:flutter/material.dart';
import 'package:rok/common/style/style.dart';

class HomeProfitLossWidget extends StatefulWidget {
  @override
  _HomeProfitLossWidgetState createState() => _HomeProfitLossWidgetState();
}

class _HomeProfitLossWidgetState extends State<HomeProfitLossWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [kAppColor("#85C1E9"), kAppColor("#2E86C1")],
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _getLineWidget("浮动盈亏", "70.0352"),
                  _getLineWidget("占用保证金", "400.05735"),
                  _getLineWidget("可用余额", "355500.032232")
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 54,
                width: 130,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [kAppColor("#85C1E9"), kAppColor("#2E86C1")],
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "入金",
                  style: TextStyle(fontSize: fontSize18, color: kAppWhiteColor),
                ),
              ),
              Container(
                height: 54,
                width: 130,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [kAppColor("#76448A"), kAppThemeColor],
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "出金",
                  style: TextStyle(fontSize: fontSize18, color: kAppWhiteColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _getLineWidget(title, price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: fontSize14, color: kAppWhiteColor),
        ),
        Text(
          price,
          style: TextStyle(fontSize: fontSize14, color: kAppWhiteColor),
        ),
      ],
    );
  }
}
