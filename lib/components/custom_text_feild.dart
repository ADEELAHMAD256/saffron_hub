import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData? icon;
  final TextInputType? textInputType;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.icon,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 20.w, right: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10.r,
              spreadRadius: 7.r,
              offset: const Offset(1, 10)),
        ],
      ),
      child: TextField(
        keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: MediaQuery.removePadding(
            context: context,
            child: Icon(
              icon,
              size: icon == null ? 0 : 25.r,
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.white, width: 1.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.white, width: 1.w),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}

class CustomPasswordTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData? icon;
  final TextInputType? textInputType;
  final bool? obscureText;
  final Widget? hideIcon;
  const CustomPasswordTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.hideIcon,
      this.icon,
      this.obscureText,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 20.w, right: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10.r,
              spreadRadius: 7.r,
              offset: const Offset(1, 10)),
        ],
      ),
      child: TextField(
        keyboardType: textInputType,
        controller: controller,
        obscureText: obscureText!,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: hideIcon,
          prefixIcon: MediaQuery.removePadding(
            context: context,
            child: Icon(
              icon,
              size: 25.r,
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.white, width: 1.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.white, width: 1.w),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldWithoutIcon extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const CustomTextFieldWithoutIcon({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 20.w, right: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10.r,
              spreadRadius: 7.r,
              offset: const Offset(1, 10)),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.white, width: 1.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.white, width: 1.w),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}
