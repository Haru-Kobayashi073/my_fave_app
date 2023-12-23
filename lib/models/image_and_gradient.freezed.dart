// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_and_gradient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageAndGradient {
  ImageProvider<Object> get image => throw _privateConstructorUsedError;
  Gradient get gradient => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageAndGradientCopyWith<ImageAndGradient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageAndGradientCopyWith<$Res> {
  factory $ImageAndGradientCopyWith(
          ImageAndGradient value, $Res Function(ImageAndGradient) then) =
      _$ImageAndGradientCopyWithImpl<$Res, ImageAndGradient>;
  @useResult
  $Res call({ImageProvider<Object> image, Gradient gradient});
}

/// @nodoc
class _$ImageAndGradientCopyWithImpl<$Res, $Val extends ImageAndGradient>
    implements $ImageAndGradientCopyWith<$Res> {
  _$ImageAndGradientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? gradient = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageProvider<Object>,
      gradient: null == gradient
          ? _value.gradient
          : gradient // ignore: cast_nullable_to_non_nullable
              as Gradient,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageAndGradientImplCopyWith<$Res>
    implements $ImageAndGradientCopyWith<$Res> {
  factory _$$ImageAndGradientImplCopyWith(_$ImageAndGradientImpl value,
          $Res Function(_$ImageAndGradientImpl) then) =
      __$$ImageAndGradientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageProvider<Object> image, Gradient gradient});
}

/// @nodoc
class __$$ImageAndGradientImplCopyWithImpl<$Res>
    extends _$ImageAndGradientCopyWithImpl<$Res, _$ImageAndGradientImpl>
    implements _$$ImageAndGradientImplCopyWith<$Res> {
  __$$ImageAndGradientImplCopyWithImpl(_$ImageAndGradientImpl _value,
      $Res Function(_$ImageAndGradientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? gradient = null,
  }) {
    return _then(_$ImageAndGradientImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageProvider<Object>,
      gradient: null == gradient
          ? _value.gradient
          : gradient // ignore: cast_nullable_to_non_nullable
              as Gradient,
    ));
  }
}

/// @nodoc

class _$ImageAndGradientImpl implements _ImageAndGradient {
  const _$ImageAndGradientImpl({required this.image, required this.gradient});

  @override
  final ImageProvider<Object> image;
  @override
  final Gradient gradient;

  @override
  String toString() {
    return 'ImageAndGradient(image: $image, gradient: $gradient)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageAndGradientImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.gradient, gradient) ||
                other.gradient == gradient));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image, gradient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageAndGradientImplCopyWith<_$ImageAndGradientImpl> get copyWith =>
      __$$ImageAndGradientImplCopyWithImpl<_$ImageAndGradientImpl>(
          this, _$identity);
}

abstract class _ImageAndGradient implements ImageAndGradient {
  const factory _ImageAndGradient(
      {required final ImageProvider<Object> image,
      required final Gradient gradient}) = _$ImageAndGradientImpl;

  @override
  ImageProvider<Object> get image;
  @override
  Gradient get gradient;
  @override
  @JsonKey(ignore: true)
  _$$ImageAndGradientImplCopyWith<_$ImageAndGradientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
