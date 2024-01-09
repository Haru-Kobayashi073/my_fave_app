// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActivityData _$ActivityDataFromJson(Map<String, dynamic> json) {
  return _ActivityData.fromJson(json);
}

/// @nodoc
mixin _$ActivityData {
  String get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityDataCopyWith<ActivityData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityDataCopyWith<$Res> {
  factory $ActivityDataCopyWith(
          ActivityData value, $Res Function(ActivityData) then) =
      _$ActivityDataCopyWithImpl<$Res, ActivityData>;
  @useResult
  $Res call(
      {String id,
      String imageUrl,
      @DateTimeConverter() DateTime? createdAt,
      bool isLiked});
}

/// @nodoc
class _$ActivityDataCopyWithImpl<$Res, $Val extends ActivityData>
    implements $ActivityDataCopyWith<$Res> {
  _$ActivityDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? createdAt = freezed,
    Object? isLiked = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityDataImplCopyWith<$Res>
    implements $ActivityDataCopyWith<$Res> {
  factory _$$ActivityDataImplCopyWith(
          _$ActivityDataImpl value, $Res Function(_$ActivityDataImpl) then) =
      __$$ActivityDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String imageUrl,
      @DateTimeConverter() DateTime? createdAt,
      bool isLiked});
}

/// @nodoc
class __$$ActivityDataImplCopyWithImpl<$Res>
    extends _$ActivityDataCopyWithImpl<$Res, _$ActivityDataImpl>
    implements _$$ActivityDataImplCopyWith<$Res> {
  __$$ActivityDataImplCopyWithImpl(
      _$ActivityDataImpl _value, $Res Function(_$ActivityDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? createdAt = freezed,
    Object? isLiked = null,
  }) {
    return _then(_$ActivityDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityDataImpl implements _ActivityData {
  const _$ActivityDataImpl(
      {required this.id,
      required this.imageUrl,
      @DateTimeConverter() this.createdAt,
      required this.isLiked});

  factory _$ActivityDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityDataImplFromJson(json);

  @override
  final String id;
  @override
  final String imageUrl;
  @override
  @DateTimeConverter()
  final DateTime? createdAt;
  @override
  final bool isLiked;

  @override
  String toString() {
    return 'ActivityData(id: $id, imageUrl: $imageUrl, createdAt: $createdAt, isLiked: $isLiked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, imageUrl, createdAt, isLiked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityDataImplCopyWith<_$ActivityDataImpl> get copyWith =>
      __$$ActivityDataImplCopyWithImpl<_$ActivityDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityDataImplToJson(
      this,
    );
  }
}

abstract class _ActivityData implements ActivityData {
  const factory _ActivityData(
      {required final String id,
      required final String imageUrl,
      @DateTimeConverter() final DateTime? createdAt,
      required final bool isLiked}) = _$ActivityDataImpl;

  factory _ActivityData.fromJson(Map<String, dynamic> json) =
      _$ActivityDataImpl.fromJson;

  @override
  String get id;
  @override
  String get imageUrl;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  bool get isLiked;
  @override
  @JsonKey(ignore: true)
  _$$ActivityDataImplCopyWith<_$ActivityDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
