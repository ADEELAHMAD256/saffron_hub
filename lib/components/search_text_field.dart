import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final double? height;
  final int? maxLines;
  final TextEditingController? controller;
  const SearchTextField(
      {Key? key, required this.hintText, this.height = 50, this.maxLines,
      this.controller
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.maxFinite,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(10.r)),
      child: TextField(
        controller:controller,
        maxLines: maxLines,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.only(left: 10.w, bottom: 7.h),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
