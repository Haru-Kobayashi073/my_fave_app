// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      uid: json['uid'] as String,
      userName: json['userName'] as String?,
      birthDay: json['birthDay'],
      gender: json['gender'] as String?,
      createdAt: json['createdAt'],
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'userName': instance.userName,
      'birthDay': instance.birthDay,
      'gender': instance.gender,
      'createdAt': instance.createdAt,
    };
