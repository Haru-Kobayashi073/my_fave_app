import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_and_gradient.freezed.dart';

@freezed
abstract class ImageAndGradient with _$ImageAndGradient {
  const factory ImageAndGradient({
    required ImageProvider<Object> image,
    required Gradient gradient,
  }) = _ImageAndGradient;
}
