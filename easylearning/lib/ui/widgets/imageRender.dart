import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'ProgressBar.dart';

class ImageRenderer extends StatelessWidget {
  final String imageUrl;
  final double? width,
      height,
      radius,
      fallbackIconBorderWidth,
      fallbackIconWidth, fallbackIconPadding;
  final IconData fallbackIcon;
  final Color fallbackIconBorderColor, fallbackIconColor;
  final BoxFit fit;

  const ImageRenderer({Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.radius = 5.0,
    required this.fallbackIcon,
    this.fallbackIconBorderWidth = 0,
    this.fallbackIconBorderColor = Colors.transparent,
    this.fallbackIconColor = Colors.grey,
    this.fallbackIconWidth = 30, this.fallbackIconPadding = 4, this.fit = BoxFit.cover,
  }) : super(key: key);

  Widget fallbackIconRender() {
    return Container(
      padding: EdgeInsets.all(fallbackIconPadding!),
      decoration: BoxDecoration(
        border: Border.all(
          color: fallbackIconBorderColor,
          width: fallbackIconBorderWidth!,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Icon(
        fallbackIcon,
        size: fallbackIconWidth,
        color: fallbackIconColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return imageUrl.isNotEmpty
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: BorderRadius.circular(radius!),
              child: Image(
                image: imageProvider,
                fit: fit,
                width: width,
                height: height,
              ),
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                ProgressBar(downloadProgress: downloadProgress.progress!),
            errorWidget: (context, url, error) => fallbackIconRender(),
          )
        : fallbackIconRender();
  }
}
