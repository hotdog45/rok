// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocketBaseModel _$SocketBaseModelFromJson(Map<String, dynamic> json) {
  return SocketBaseModel(
    json['ch'] as String,
    json['ts'] as int,
    json['tick'],
  );
}

Map<String, dynamic> _$SocketBaseModelToJson(SocketBaseModel instance) =>
    <String, dynamic>{
      'ch': instance.ch,
      'ts': instance.ts,
      'tick': instance.tick,
    };
