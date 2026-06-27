import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TShimerEffect extends StatelessWidget {
  const TShimerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
    this.shape = BoxShape.rectangle,
    this.margin,
  });

  factory TShimerEffect.text({
    Key? key,
    required double width,
    TextStyle? style,
    Color? color,
    EdgeInsetsGeometry? margin,
  }) {

    final lineHeight = (style?.fontSize ?? 14) * 0.7;
    return TShimerEffect(
      key: key,
      width: width,
      height: lineHeight,
      radius: lineHeight / 2, 
      color: color,
      margin: margin,
    );
  }

  final double width;
  final double height;
  final double radius;
  final Color? color;
  final BoxShape shape;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    final baseColor = isDark ? Colors.grey[850]! : Colors.grey[300]!;
    final highlightColor = isDark ? Colors.grey[700]! : Colors.grey[100]!;

    return IgnorePointer(
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        period: const Duration(milliseconds: 1200),
        child: Container(
          width: width,
          height: height,
          margin: margin,
          decoration: BoxDecoration(
            color: color ?? baseColor,
            shape: shape,
            borderRadius:
                shape == BoxShape.circle ? null : BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}