// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget widget;
  const CustomContainer({required this.widget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              const Color.fromRGBO(97, 206, 255, 0.72),
              const Color(0xffFFFFFF),
              const Color(0xffFFFFFF),
              const Color(0xffFFFFFF),
              const Color(0xff96CCD5).withOpacity(0.3),
            ])),
        child: widget,
      ),
    );
  }
}
