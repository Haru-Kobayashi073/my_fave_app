/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/apple_icon.svg
  String get appleIcon => 'assets/icons/apple_icon.svg';

  /// File path: assets/icons/google_icon.svg
  String get googleIcon => 'assets/icons/google_icon.svg';

  /// File path: assets/icons/my-fave-android-icon.png
  AssetGenImage get myFaveAndroidIcon =>
      const AssetGenImage('assets/icons/my-fave-android-icon.png');

  /// File path: assets/icons/my-fave-app-icon.png
  AssetGenImage get myFaveAppIcon =>
      const AssetGenImage('assets/icons/my-fave-app-icon.png');

  /// File path: assets/icons/my-fave-app-text.png
  AssetGenImage get myFaveAppText =>
      const AssetGenImage('assets/icons/my-fave-app-text.png');

  /// File path: assets/icons/my_fave_logo.svg
  String get myFaveLogo => 'assets/icons/my_fave_logo.svg';

  /// File path: assets/icons/touched_location.svg
  String get touchedLocation => 'assets/icons/touched_location.svg';

  /// File path: assets/icons/untouched_location.svg
  String get untouchedLocation => 'assets/icons/untouched_location.svg';

  /// File path: assets/icons/x_twitter_icon.svg
  String get xTwitterIcon => 'assets/icons/x_twitter_icon.svg';

  /// List of all assets
  List<dynamic> get values => [
        appleIcon,
        googleIcon,
        myFaveAndroidIcon,
        myFaveAppIcon,
        myFaveAppText,
        myFaveLogo,
        touchedLocation,
        untouchedLocation,
        xTwitterIcon
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/first_view_app.png
  AssetGenImage get firstViewApp =>
      const AssetGenImage('assets/images/first_view_app.png');

  /// File path: assets/images/fourth_view_app.png
  AssetGenImage get fourthViewApp =>
      const AssetGenImage('assets/images/fourth_view_app.png');

  /// File path: assets/images/map_view_image.png
  AssetGenImage get mapViewImage =>
      const AssetGenImage('assets/images/map_view_image.png');

  /// File path: assets/images/second_view_app.png
  AssetGenImage get secondViewApp =>
      const AssetGenImage('assets/images/second_view_app.png');

  /// File path: assets/images/third_view_app.png
  AssetGenImage get thirdViewApp =>
      const AssetGenImage('assets/images/third_view_app.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [firstViewApp, fourthViewApp, mapViewImage, secondViewApp, thirdViewApp];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
