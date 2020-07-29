import 'package:flutter/material.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/round_slider_track_shape.dart';
/**
 * Copyright (C), 2015-2020, 谊品生鲜
 * FileName: my_slider
 * Author: lishunfeng
 * Date: 2020/7/29 10:48 PM
 * Description:
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */
class MySlider extends StatelessWidget {

  final double value;
  final ValueChanged<double> onChanged;

  const MySlider({Key key, this.value, this.onChanged}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: SliderTheme(
        //自定义风格
        data: SliderTheme.of(context).copyWith(
            activeTrackColor: kAppThemeColor, //进度条滑块左边颜色
            inactiveTrackColor: kAppSub2TextColor, //进度条滑块右边颜色
            trackShape:
            RoundSliderTrackShape(radius: 1), //进度条形状,这边自定义两头显示圆角
            thumbColor: kAppThemeColor, //滑块颜色
            overlayColor: Colors.green, //滑块拖拽时外圈的颜色
            overlayShape: RoundSliderOverlayShape(
              //可继承SliderComponentShape自定义形状
              overlayRadius: 3, //滑块外圈大小
            ),
            thumbShape: RoundSliderThumbShape(
              //可继承SliderComponentShape自定义形状
              disabledThumbRadius: 15, //禁用是滑块大小
              enabledThumbRadius: 12, //滑块大小
            ),
            inactiveTickMarkColor: kAppSub2TextColor,
            tickMarkShape: RoundSliderTickMarkShape(
              //继承SliderTickMarkShape可自定义刻度形状
              tickMarkRadius: 7.0, //刻度大小
            ),
            showValueIndicator:
            ShowValueIndicator.onlyForDiscrete, //气泡显示的形式
            valueIndicatorColor: kGreenColor, //气泡颜色
            valueIndicatorShape:
            PaddleSliderValueIndicatorShape(), //气泡形状
            valueIndicatorTextStyle:
            TextStyle(color: kAppWhiteColor), //气泡里值的风格
            trackHeight: 2 //进度条宽度

        ),
        child: Slider(
            value: value,
            min: 0,
            max: 100,
            divisions: 4,
            label: '${value}%',
//                    activeColor: kAppThemeColor,
//                    inactiveColor: kAppSub2TextColor,
            onChangeStart: (value) {
              print('开始滑动:$value');
            },
            onChangeEnd: (value) {
              print('滑动结束:$value');
            },
            onChanged: onChanged),
      ),
    );
  }
}
