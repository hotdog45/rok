import 'package:flutter/material.dart';
/**
 * Copyright (C), 2015-2020, 谊品生鲜
 * FileName: operation_records_model
 * Author: lishunfeng
 * Date: 2020/10/17 5:38 PM
 * Description:
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

import 'package:json_annotation/json_annotation.dart';

part 'operation_records_model.g.dart';


@JsonSerializable()
class OperationRecordsModel extends Object {

  @JsonKey(name: 'last5')
  List<OperationRecords> last5;

  @JsonKey(name: 'top5')
  List<OperationRecords> top5;

  OperationRecordsModel(this.last5,this.top5,);

  factory OperationRecordsModel.fromJson(Map<String, dynamic> srcJson) => _$OperationRecordsModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OperationRecordsModelToJson(this);

}


@JsonSerializable()
class OperationRecords extends Object {

  @JsonKey(name: 'amount')
  double amount;

  @JsonKey(name: 'chg')
  double chg;

  @JsonKey(name: 'close')
  double close;

  @JsonKey(name: 'contractName')
  String contractName;

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'high')
  double high;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'low')
  double low;

  @JsonKey(name: 'open')
  double open;

  @JsonKey(name: 'ts')
  int ts;

  @JsonKey(name: 'vol')
  double vol;

  OperationRecords(this.amount,this.chg,this.close,this.contractName,this.count,this.high,this.id,this.low,this.open,this.ts,this.vol,);

  factory OperationRecords.fromJson(Map<String, dynamic> srcJson) => _$OperationRecordsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OperationRecordsToJson(this);

}



