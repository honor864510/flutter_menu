// dart format width=120

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/food1.jpg
  AssetGenImage get food1 => const AssetGenImage('assets/images/food1.jpg');

  /// File path: assets/images/food10.jpg
  AssetGenImage get food10 => const AssetGenImage('assets/images/food10.jpg');

  /// File path: assets/images/food2.jpg
  AssetGenImage get food2 => const AssetGenImage('assets/images/food2.jpg');

  /// File path: assets/images/food3.jpg
  AssetGenImage get food3 => const AssetGenImage('assets/images/food3.jpg');

  /// File path: assets/images/food4.jpg
  AssetGenImage get food4 => const AssetGenImage('assets/images/food4.jpg');

  /// File path: assets/images/food5.jpg
  AssetGenImage get food5 => const AssetGenImage('assets/images/food5.jpg');

  /// File path: assets/images/food6.jpg
  AssetGenImage get food6 => const AssetGenImage('assets/images/food6.jpg');

  /// File path: assets/images/food7.jpg
  AssetGenImage get food7 => const AssetGenImage('assets/images/food7.jpg');

  /// File path: assets/images/food8.jpg
  AssetGenImage get food8 => const AssetGenImage('assets/images/food8.jpg');

  /// File path: assets/images/food9.jpg
  AssetGenImage get food9 => const AssetGenImage('assets/images/food9.jpg');

  /// File path: assets/images/restaurant.png
  AssetGenImage get restaurant => const AssetGenImage('assets/images/restaurant.png');

  /// List of all assets
  List<AssetGenImage> get values => [food1, food10, food2, food3, food4, food5, food6, food7, food8, food9, restaurant];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}, this.animation});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({required this.isAnimation, required this.duration, required this.frames});

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
