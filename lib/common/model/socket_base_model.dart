import 'package:json_annotation/json_annotation.dart';

part 'socket_base_model.g.dart';


@JsonSerializable()
class SocketBaseModel extends Object {

  @JsonKey(name: 'ch')
  String ch;

  @JsonKey(name: 'ts')
  int ts;

  @JsonKey(name: 'tick')
  var tick;

  SocketBaseModel(this.ch,this.ts,this.tick,);

  factory SocketBaseModel.fromJson(Map<String, dynamic> srcJson) => _$SocketBaseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SocketBaseModelToJson(this);

}


