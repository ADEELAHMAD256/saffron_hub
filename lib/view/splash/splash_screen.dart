import 'dart:async';
import 'package:flutter/material.dart';
import 'package:saffron_hub/provider/sign_up_controller.dart';
import 'package:saffron_hub/view/home/home_screen.dart';
import 'package:saffron_hub/view/sign_in/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "SplashScreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //SignUpController signUpController = SignUpController();
  @override
  // void initState() {
  //   //signUpController.getLogin();
  //   Timer(
  //     Duration(seconds: 3),
  //     () => Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())),
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/saffron-hub-logo.png"),
      ),
    );
  }
}
