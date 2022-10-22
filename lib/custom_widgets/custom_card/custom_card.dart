import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? cardColor;
  final double? cardRadius;
  final Widget? cardChild;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;

  const CustomCard(
      {super.key,
      this.height,
      this.width,
      this.cardColor,
      this.cardRadius,
      this.cardChild,
      this.border,
      this.boxShadow});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: cardColor,
          border: border,
          borderRadius: BorderRadius.circular(cardRadius!),
          boxShadow: boxShadow),
      child: cardChild,
    );
  }
}
