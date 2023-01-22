// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType textInputType;
  final String hintText;
  final String? validateText;
  final TextAlign textAlign;

  const CustomTextFormFiled(
      {this.controller,
      this.textInputType = TextInputType.multiline,
      required this.hintText,
      this.textAlign = TextAlign.center,
      this.validateText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color(0xffE76880),
      controller: controller,
      keyboardType: textInputType,
      textAlign: textAlign,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: const Color(0xff677294).withOpacity(0.16),
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: const Color(0xff677294).withOpacity(0.16),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: const Color(0xff677294).withOpacity(0.16),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.red,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.red,
            )),
        contentPadding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 20.w),
        hintText: hintText,
        hintStyle: TextStyle(
            fontFamily: "Rubik",
            color: const Color(0xff677294),
            fontWeight: FontWeight.w300,
            fontSize: 16.sp),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validateText;
        }
        return null;
      },
    );
  }
}

class CustomTextFormFiledPassword extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType textInputType;
  final String hintText;
  final TextAlign textAlign;

  const CustomTextFormFiledPassword(
      {this.controller,
      this.textInputType = TextInputType.visiblePassword,
      required this.hintText,
      this.textAlign = TextAlign.start});

  @override
  State<CustomTextFormFiledPassword> createState() =>
      _CustomTextFormFiledPasswordState();
}

class _CustomTextFormFiledPasswordState
    extends State<CustomTextFormFiledPassword> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color(0xffE76880),
      controller: widget.controller,
      keyboardType: widget.textInputType,
      textAlign: widget.textAlign,
      obscureText: show,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: const Color(0xff677294).withOpacity(0.16),
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: const Color(0xff677294).withOpacity(0.16),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: const Color(0xff677294).withOpacity(0.16),
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              show = !show;
            });
          },
          icon: Icon(
            show == false ? Icons.visibility : Icons.visibility_off,
            color: const Color(0xff677294),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 20.w),
        hintText: widget.hintText,
        hintStyle: TextStyle(
            fontFamily: "Rubik",
            color: const Color(0xff677294),
            fontWeight: FontWeight.w300,
            fontSize: 16.sp),
      ),
    );
  }
}
