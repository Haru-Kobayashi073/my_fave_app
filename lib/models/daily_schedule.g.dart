// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyScheduleImpl _$$DailyScheduleImplFromJson(Map<String, dynamic> json) =>
    _$DailyScheduleImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      location: json['location'] as String,
      isAllDay: json['isAllDay'] as bool?,
      start: const DateTimeConverter().fromJson(json['start'] as String),
      end: _$JsonConverterFromJson<String, DateTime>(
          json['end'], const DateTimeConverter().fromJson),
      url: json['url'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$DailyScheduleImplToJson(_$DailyScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'location': instance.location,
      'isAllDay': instance.isAllDay,
      'start': const DateTimeConverter().toJson(instance.start),
      'end': _$JsonConverterToJson<String, DateTime>(
          instance.end, const DateTimeConverter().toJson),
      'url': instance.url,
      'notes': instance.notes,
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
