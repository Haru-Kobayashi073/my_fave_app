// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DailySchedule _$DailyScheduleFromJson(Map<String, dynamic> json) {
  return _DailySchedule.fromJson(json);
}

/// @nodoc
mixin _$DailySchedule {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  bool? get isAllDay => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get start => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get end => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyScheduleCopyWith<DailySchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyScheduleCopyWith<$Res> {
  factory $DailyScheduleCopyWith(
          DailySchedule value, $Res Function(DailySchedule) then) =
      _$DailyScheduleCopyWithImpl<$Res, DailySchedule>;
  @useResult
  $Res call(
      {String id,
      String title,
      String location,
      bool? isAllDay,
      @DateTimeConverter() DateTime start,
      @DateTimeConverter() DateTime? end,
      String? url,
      String? notes});
}

/// @nodoc
class _$DailyScheduleCopyWithImpl<$Res, $Val extends DailySchedule>
    implements $DailyScheduleCopyWith<$Res> {
  _$DailyScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? location = null,
    Object? isAllDay = freezed,
    Object? start = null,
    Object? end = freezed,
    Object? url = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      isAllDay: freezed == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool?,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyScheduleImplCopyWith<$Res>
    implements $DailyScheduleCopyWith<$Res> {
  factory _$$DailyScheduleImplCopyWith(
          _$DailyScheduleImpl value, $Res Function(_$DailyScheduleImpl) then) =
      __$$DailyScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String location,
      bool? isAllDay,
      @DateTimeConverter() DateTime start,
      @DateTimeConverter() DateTime? end,
      String? url,
      String? notes});
}

/// @nodoc
class __$$DailyScheduleImplCopyWithImpl<$Res>
    extends _$DailyScheduleCopyWithImpl<$Res, _$DailyScheduleImpl>
    implements _$$DailyScheduleImplCopyWith<$Res> {
  __$$DailyScheduleImplCopyWithImpl(
      _$DailyScheduleImpl _value, $Res Function(_$DailyScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? location = null,
    Object? isAllDay = freezed,
    Object? start = null,
    Object? end = freezed,
    Object? url = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$DailyScheduleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      isAllDay: freezed == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool?,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyScheduleImpl implements _DailySchedule {
  const _$DailyScheduleImpl(
      {required this.id,
      required this.title,
      required this.location,
      this.isAllDay,
      @DateTimeConverter() required this.start,
      @DateTimeConverter() this.end,
      this.url,
      this.notes});

  factory _$DailyScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyScheduleImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String location;
  @override
  final bool? isAllDay;
  @override
  @DateTimeConverter()
  final DateTime start;
  @override
  @DateTimeConverter()
  final DateTime? end;
  @override
  final String? url;
  @override
  final String? notes;

  @override
  String toString() {
    return 'DailySchedule(id: $id, title: $title, location: $location, isAllDay: $isAllDay, start: $start, end: $end, url: $url, notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isAllDay, isAllDay) ||
                other.isAllDay == isAllDay) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, location, isAllDay, start, end, url, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyScheduleImplCopyWith<_$DailyScheduleImpl> get copyWith =>
      __$$DailyScheduleImplCopyWithImpl<_$DailyScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyScheduleImplToJson(
      this,
    );
  }
}

abstract class _DailySchedule implements DailySchedule {
  const factory _DailySchedule(
      {required final String id,
      required final String title,
      required final String location,
      final bool? isAllDay,
      @DateTimeConverter() required final DateTime start,
      @DateTimeConverter() final DateTime? end,
      final String? url,
      final String? notes}) = _$DailyScheduleImpl;

  factory _DailySchedule.fromJson(Map<String, dynamic> json) =
      _$DailyScheduleImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get location;
  @override
  bool? get isAllDay;
  @override
  @DateTimeConverter()
  DateTime get start;
  @override
  @DateTimeConverter()
  DateTime? get end;
  @override
  String? get url;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$DailyScheduleImplCopyWith<_$DailyScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
