// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarkerDataImpl _$$MarkerDataImplFromJson(Map<String, dynamic> json) =>
    _$MarkerDataImpl(
      markerId: json['markerId'] as String,
      createdAt: json['createdAt'],
      title: json['title'] as String,
      location: json['location'] as String,
      imageUrl: json['imageUrl'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$$MarkerDataImplToJson(_$MarkerDataImpl instance) =>
    <String, dynamic>{
      'markerId': instance.markerId,
      'createdAt': instance.createdAt,
      'title': instance.title,
      'location': instance.location,
      'imageUrl': instance.imageUrl,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'memo': instance.memo,
    };
