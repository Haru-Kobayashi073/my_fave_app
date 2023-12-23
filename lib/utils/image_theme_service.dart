import 'dart:math';

import 'package:flutter/material.dart' as material;
import 'package:image/image.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:material_color_utilities/utils/color_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_theme_service.g.dart';

@riverpod
ImageThemeService imageThemeService(ImageThemeServiceRef ref) =>
    ImageThemeService(ref);

class ImageThemeService {
  ImageThemeService(this.ref);

  final AutoDisposeProviderRef<ImageThemeService> ref;

  /// 上位4つの色を返す
  Future<List<material.Color>> sourceColorsFromImage(Image image) async {
    // 処理を軽くするためにリサイズ（当然結果が変わるので注意）
    final resizedImage = copyResize(image, width: 512, height: 512);

    // ピクセルごとのargb形式のintのリスト
    final pixels = <int>[];

    for (var y = 0; y < resizedImage.height; y++) {
      for (var x = 0; x < resizedImage.width; x++) {
        // 画像のピクセルの色を取得
        final pixel = resizedImage.getPixel(x, y);

        pixels.add(
          ColorUtils.argbFromRgb(
            pixel.r.toInt(),
            pixel.g.toInt(),
            pixel.b.toInt(),
          ),
        );
      }
    }

    // セレビィさん考案のアルゴリズムで量子化
    final quantizerResult = await QuantizerCelebi().quantize(pixels, 128);
    // 量子化した色のリストをスコアリング
    final ranked = Score.score(quantizerResult.colorToCount);

    // スコアの高い4色を返す
    return ranked.take(2).map(material.Color.new).toList();
  }

// Gradient型を返り値にする関数
  material.Gradient buildRandomGradient(List<material.Color> colors) {
    // ランダムな順番で色をシャッフル
    final shuffledColors = List<material.Color>.from(colors)..shuffle();

    // 各色の割合を同じにする
    final stops =
        List.generate(colors.length, (index) => index / (colors.length - 1));

    final (begin, end) = randomAlignment();

    // グラデーションを構築
    return material.LinearGradient(
      colors: shuffledColors,
      begin: begin,
      end: end,
      stops: stops,
    );
  }

  static (material.Alignment, material.Alignment) randomAlignment() {
    // 画面右上部と左下部のセットか画面左上部と右下部のセットのどちらにするかグラデーションを配置するかランダムに決める
    final alignmentsForTop = [
      material.FractionalOffset.topLeft,
      material.FractionalOffset.topRight,
    ];
    final alignmentsForBottom = [
      material.FractionalOffset.bottomLeft,
      material.FractionalOffset.bottomRight,
    ];
    final random = Random();
    final randomIndex = random.nextInt(alignmentsForTop.length);
    final begin = alignmentsForTop[randomIndex];
    final end = alignmentsForBottom[randomIndex == 0 ? 1 : 0];
    return (begin, end);
  }
}
