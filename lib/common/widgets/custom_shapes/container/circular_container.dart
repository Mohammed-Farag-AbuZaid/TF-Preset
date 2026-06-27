import "package:flutter/material.dart";

class TCircularContianer extends StatelessWidget {
  const TCircularContianer({
    super.key,
    this.width ,
    this.height,
    this.padding = EdgeInsets.zero,
    this.borderRadius = TSizes.cardRadiusLg,
    this.backgroundColor = TColors.textwhite,
    this.child,
    this.margin,
    this.showBorder = false,
    this.borderColor = TColors.borderPrimary,
  });

  final double? width;
  final double? height;
  final double borderRadius;
  final Color backgroundColor;
  final Widget? child;
  final Color borderColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool showBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,

      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius), border: showBorder ? Border.all(color: borderColor) : null),
      child: child,
    );
  }
}
