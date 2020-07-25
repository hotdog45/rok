import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';


@JsonSerializable()
  class BaseModel extends Object {

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  var data;

  @JsonKey(name: 'code')
  int code;

  BaseModel(this.message,this.data,this.code,);

  factory BaseModel.fromJson(Map<String, dynamic> srcJson) => _$BaseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);

}