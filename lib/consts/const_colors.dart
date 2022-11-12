import 'dart:ui';

import 'package:flutter/material.dart';

const Color kYellow = Color(0xffF99D1B);
const Color kGray = Color(0xffC4C4C4);
const Color kPurple = Color(0xff4A1D51);
const Color kLightGray = Color(0xff9098B1);

const MaterialColor appColor = MaterialColor(
  _colorPrimaryValue,
  <int, Color>{
    50: Color(_colorPrimaryValue),
    100: Color(_colorPrimaryValue),
    200: Color(_colorPrimaryValue),
    300: Color(_colorPrimaryValue),
    400: Color(_colorPrimaryValue),
    500: Color(_colorPrimaryValue),
    600: Color(_colorPrimaryValue),
    700: Color(_colorPrimaryValue),
    800: Color(_colorPrimaryValue),
    900: Color(_colorPrimaryValue),
  },
);
const int _colorPrimaryValue = 0xffF99D1B;
