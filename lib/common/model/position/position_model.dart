import 'package:flutter/material.dart';
/**
 * Copyright (C), 2015-2020, 谊品生鲜
 * FileName: position_model.dart
 * Author: lishunfeng
 * Date: 11/24/20 10:02 PM
 * Description:
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

import 'package:json_annotation/json_annotation.dart';

part 'position_model.g.dart';


@JsonSerializable()
class PositionModel extends Object {

  @JsonKey(name: 'balance')
  int balance;

  @JsonKey(name: 'contactCode')
  String contactCode;

  @JsonKey(name: 'contactName')
  String contactName;

  @JsonKey(name: 'contractType')
  int contractType;

  @JsonKey(name: 'frozenBalance')
  int frozenBalance;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'lossPrice')
  int lossPrice;

  @JsonKey(name: 'multiple')
  int multiple;

  @JsonKey(name: 'price')
  int price;

  @JsonKey(name: 'profit')
  int profit;

  @JsonKey(name: 'profitPrice')
  int profitPrice;

  @JsonKey(name: 'profitRate')
  int profitRate;

  @JsonKey(name: 'side')
  int side;

  @JsonKey(name: 'symbol')
  String symbol;

  @JsonKey(name: 'tradeQuantity')
  int tradeQuantity;

  @JsonKey(name: 'tradeTime')
  String tradeTime;

  PositionModel(this.balance,this.contactCode,this.contactName,this.contractType,this.frozenBalance,this.id,this.lossPrice,this.multiple,this.price,this.profit,this.profitPrice,this.profitRate,this.side,this.symbol,this.tradeQuantity,this.tradeTime,);

  factory PositionModel.fromJson(Map<String, dynamic> srcJson) => _$PositionModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PositionModelToJson(this);

}


