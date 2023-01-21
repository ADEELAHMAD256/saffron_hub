import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? fontColor;
  final TextAlign? textAlign;
  final double? letterSpacing;

  const CustomText(
      {@required this.text,
      this.fontWeight,
      this.fontSize,
      this.fontColor,
      this.textAlign,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: "Rubik",
        color: fontColor,
        letterSpacing: letterSpacing,
      ),
      overflow: TextOverflow.clip,
    );
  }
}
