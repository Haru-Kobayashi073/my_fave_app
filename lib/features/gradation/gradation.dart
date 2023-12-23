import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as image;
import 'package:my_fave_app/models/image_and_gradient.dart';
import 'package:my_fave_app/utils/image_theme_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gradation.g.dart';

@riverpod
class Gradation extends _$Gradation {
  @override
  Future<ImageAndGradient> build() async {
    // const asset =
    //     'https://images.unsplash.com/photo-1697168248031-7a8333f70930?q=80&w=3386&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
    // const asset =
    //     'https://images.unsplash.com/photo-1694401460974-4d8f8366bf64?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDgwfE04alZiTGJUUndzfHxlbnwwfHx8fHw%3D';
    const asset =
        'https://bongona.jp/wp-content/uploads/2023/09/NewJeans%E3%83%8B%E3%83%A5%E3%83%BC%E3%82%B8%E3%83%BC%E3%83%B3%E3%82%BA-%E3%83%9F%E3%83%B3%E3%82%B8MINJI-2024-SS-SEOUL-FASHION-WEEK-5.jpg';

    final bytes = await NetworkAssetBundle(Uri.parse(asset)).load(asset);
    final decoded = image.decodeImage(bytes.buffer.asUint8List());
    // 処理が重いので別スレッドで実行したい
    final colors = await ref
        .watch(imageThemeServiceProvider)
        .sourceColorsFromImage(decoded!);
// final colors = await compute(
//     ref.watch(imageThemeServiceProvider).sourceColorsFromImage, decoded!);
    final gradient =
        ref.watch(imageThemeServiceProvider).buildRandomGradient(colors);
    final imageAndColors = ImageAndGradient(
      image: const CachedNetworkImageProvider(asset),
      gradient: gradient,
    );
    return imageAndColors;
  }
}
