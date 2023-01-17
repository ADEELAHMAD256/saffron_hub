import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      this.text,
      this.fontSize,
      this.fontWeight,
      this.fontColor,
      this.textOverflow});
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: textOverflow,
      // textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
        fontFamily: "assets/font_family/Poppins-Regular.ttf",
      ),
    );
  }
}
