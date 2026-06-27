import 'package:flutter/material.dart';


class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    required this.imagePath,
    this.borderRadius = TSizes.md,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.applyImageRadius = true,
    this.border,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.backgroundColor,
  });

  final String imagePath;
  final double borderRadius;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final bool applyImageRadius;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color:
            backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? TColors.black
                : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: isNetworkImage
            ? CachedNetworkImage(
                fit: fit,
                color: backgroundColor,
                imageUrl: imagePath,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const TShimerEffect(width: 55, height: 55),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            : Image(
                fit: fit,
                image: AssetImage(imagePath),
                color: backgroundColor,
              ),
      ),
    );
  }
}
