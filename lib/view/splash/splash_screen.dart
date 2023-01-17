import 'dart:async';
import 'package:flutter/material.dart';
import 'package:saffron_hub/view/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "SplashScreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, HomeScreen.id),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/saffron-hub-logo.png"),
      ),
    );
  }
}
