import 'package:json_annotation/json_annotation.dart'; 
  
part 'gateway_base_model.g.dart';


@JsonSerializable()
  class GatewayBaseModel extends Object {

  @JsonKey(name: 'success')
  bool success;

  @JsonKey(name: 'result')
  Result result;

  @JsonKey(name: 'error')
  Error error;

  @JsonKey(name: 'traceId')
  String traceId;

  GatewayBaseModel(this.success,this.result,this.traceId,this.error,);

  factory GatewayBaseModel.fromJson(Map<String, dynamic> srcJson) => _$GatewayBaseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GatewayBaseModelToJson(this);

}
@JsonSerializable()
class Error extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  Error(this.code,this.message,);

  factory Error.fromJson(Map<String, dynamic> srcJson) => _$ErrorFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);

}
  
@JsonSerializable()
  class Result extends Object {

  @JsonKey(name: 'success')
  var success;

  @JsonKey(name: 'result')
  var result;

  @JsonKey(name: 'error')
  Error error;

  Result(this.success,this.result,this.error,);

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}


  
