import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NetworkAsset extends StatelessWidget {
  final String assetUrl;
  final BoxFit fit;
  final String? defaultAsset;
  final double? width;
  final double? height;
  const NetworkAsset({
    super.key,
    required this.assetUrl,
    this.fit = BoxFit.fill,
    this.defaultAsset,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return getAssetWidgetWithPlaceholder(assetUrl);
  }

  Widget getAssetWidgetWithPlaceholder(String assetPath) {
    final isSvg = assetPath.endsWith('.svg');
    if (isSvg) {
      return SvgPicture.network(
        assetPath,
        fit: fit,
        width: width,
        height: height,
        placeholderBuilder: (context) => getAssetWidget(defaultAsset ?? ''),
        errorBuilder: (context, error, stackTrace) =>
            getAssetWidget(defaultAsset ?? ''),
      );
    } else {
      return CachedNetworkImage(
        imageUrl: assetPath,
        fit: fit,
        width: width,
        height: height,
        placeholder: (context, url) => getAssetWidget(defaultAsset ?? ''),
        errorWidget: (context, error, stackTrace) =>
            getAssetWidget(defaultAsset ?? ''),
      );
    }
  }

  Widget getAssetWidget(String assetPath) {
    if (assetPath.isEmpty) {
      return const SizedBox.shrink();
    }
    if (assetPath.endsWith('.svg')) {
      return SvgPicture.asset(
        assetPath,
        fit: fit,
        width: width,
        height: height,
      );
    } else {
      return Image.asset(assetPath, fit: fit, width: width, height: height);
    }
  }
}
