import 'package:flutter/material.dart';
/**
 * Copyright (C), 2015-2020, 谊品生鲜
 * FileName: number_utils
 * Author: lishunfeng
 * Date: 2020/8/1 4:10 PM
 * Description:
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

class NumberUtils {

  static formatNum(double num,int postion){
    if((num.toString().length-num.toString().lastIndexOf(".")-1)<postion){
      //小数点后有几位小数
      return  num.toStringAsFixed(postion).substring(0,num.toString().lastIndexOf(".")+postion+1);
    }else{
      return num.toString().substring(0,num.toString().lastIndexOf(".")+postion+1);
    }
  }
}