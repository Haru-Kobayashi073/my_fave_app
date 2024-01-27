// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarkerDataImpl _$$MarkerDataImplFromJson(Map<String, dynamic> json) =>
    _$MarkerDataImpl(
      markerId: json['markerId'] as String,
      favoriteId: json['favoriteId'] as String,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
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
      'favoriteId': instance.favoriteId,
      'createdAt': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
      'title': instance.title,
      'location': instance.location,
      'imageUrl': instance.imageUrl,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'memo': instance.memo,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
