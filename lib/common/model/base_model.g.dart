// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) {
  return BaseModel(
    json['message'] as String,
    json['data'],
    json['code'] as int,
  );
}

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'code': instance.code,
    };
