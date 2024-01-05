import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as image;
import 'package:my_fave_app/utils/image_theme_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gradation.g.dart';

@riverpod
Future<Gradient> gradation(GradationRef ref, String imgUrl) async {
  final bytes = await NetworkAssetBundle(Uri.parse(imgUrl)).load(imgUrl);
  final decoded = image.decodeImage(bytes.buffer.asUint8List());
  // 処理が重いので別スレッドで実行したい
  final colors = await ref
      .watch(imageThemeServiceProvider)
      .sourceColorsFromImage(decoded!);
// final colors = await compute(
//     ref.watch(imageThemeServiceProvider).sourceColorsFromImage, decoded!);
  final gradient =
      ref.watch(imageThemeServiceProvider).buildRandomGradient(colors);
  return gradient;
}
