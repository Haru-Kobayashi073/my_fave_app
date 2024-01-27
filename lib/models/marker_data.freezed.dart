// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marker_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MarkerData _$MarkerDataFromJson(Map<String, dynamic> json) {
  return _MarkerData.fromJson(json);
}

/// @nodoc
mixin _$MarkerData {
  String get markerId => throw _privateConstructorUsedError;
  String get favoriteId => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String? get memo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarkerDataCopyWith<MarkerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkerDataCopyWith<$Res> {
  factory $MarkerDataCopyWith(
          MarkerData value, $Res Function(MarkerData) then) =
      _$MarkerDataCopyWithImpl<$Res, MarkerData>;
  @useResult
  $Res call(
      {String markerId,
      String favoriteId,
      @DateTimeConverter() DateTime? createdAt,
      String title,
      String location,
      String imageUrl,
      double latitude,
      double longitude,
      String? memo});
}

/// @nodoc
class _$MarkerDataCopyWithImpl<$Res, $Val extends MarkerData>
    implements $MarkerDataCopyWith<$Res> {
  _$MarkerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markerId = null,
    Object? favoriteId = null,
    Object? createdAt = freezed,
    Object? title = null,
    Object? location = null,
    Object? imageUrl = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? memo = freezed,
  }) {
    return _then(_value.copyWith(
      markerId: null == markerId
          ? _value.markerId
          : markerId // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteId: null == favoriteId
          ? _value.favoriteId
          : favoriteId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarkerDataImplCopyWith<$Res>
    implements $MarkerDataCopyWith<$Res> {
  factory _$$MarkerDataImplCopyWith(
          _$MarkerDataImpl value, $Res Function(_$MarkerDataImpl) then) =
      __$$MarkerDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String markerId,
      String favoriteId,
      @DateTimeConverter() DateTime? createdAt,
      String title,
      String location,
      String imageUrl,
      double latitude,
      double longitude,
      String? memo});
}

/// @nodoc
class __$$MarkerDataImplCopyWithImpl<$Res>
    extends _$MarkerDataCopyWithImpl<$Res, _$MarkerDataImpl>
    implements _$$MarkerDataImplCopyWith<$Res> {
  __$$MarkerDataImplCopyWithImpl(
      _$MarkerDataImpl _value, $Res Function(_$MarkerDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markerId = null,
    Object? favoriteId = null,
    Object? createdAt = freezed,
    Object? title = null,
    Object? location = null,
    Object? imageUrl = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? memo = freezed,
  }) {
    return _then(_$MarkerDataImpl(
      markerId: null == markerId
          ? _value.markerId
          : markerId // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteId: null == favoriteId
          ? _value.favoriteId
          : favoriteId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarkerDataImpl implements _MarkerData {
  const _$MarkerDataImpl(
      {required this.markerId,
      required this.favoriteId,
      @DateTimeConverter() this.createdAt,
      required this.title,
      required this.location,
      required this.imageUrl,
      required this.latitude,
      required this.longitude,
      this.memo});

  factory _$MarkerDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarkerDataImplFromJson(json);

  @override
  final String markerId;
  @override
  final String favoriteId;
  @override
  @DateTimeConverter()
  final DateTime? createdAt;
  @override
  final String title;
  @override
  final String location;
  @override
  final String imageUrl;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String? memo;

  @override
  String toString() {
    return 'MarkerData(markerId: $markerId, favoriteId: $favoriteId, createdAt: $createdAt, title: $title, location: $location, imageUrl: $imageUrl, latitude: $latitude, longitude: $longitude, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkerDataImpl &&
            (identical(other.markerId, markerId) ||
                other.markerId == markerId) &&
            (identical(other.favoriteId, favoriteId) ||
                other.favoriteId == favoriteId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, markerId, favoriteId, createdAt,
      title, location, imageUrl, latitude, longitude, memo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkerDataImplCopyWith<_$MarkerDataImpl> get copyWith =>
      __$$MarkerDataImplCopyWithImpl<_$MarkerDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarkerDataImplToJson(
      this,
    );
  }
}

abstract class _MarkerData implements MarkerData {
  const factory _MarkerData(
      {required final String markerId,
      required final String favoriteId,
      @DateTimeConverter() final DateTime? createdAt,
      required final String title,
      required final String location,
      required final String imageUrl,
      required final double latitude,
      required final double longitude,
      final String? memo}) = _$MarkerDataImpl;

  factory _MarkerData.fromJson(Map<String, dynamic> json) =
      _$MarkerDataImpl.fromJson;

  @override
  String get markerId;
  @override
  String get favoriteId;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  String get title;
  @override
  String get location;
  @override
  String get imageUrl;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String? get memo;
  @override
  @JsonKey(ignore: true)
  _$$MarkerDataImplCopyWith<_$MarkerDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
