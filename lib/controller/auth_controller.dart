// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:saffron_hub/models/login.dart';
import 'package:saffron_hub/view/home/home_screen.dart';
import 'package:saffron_hub/view/sign_in/sign_in_screen.dart';
import 'package:saffron_hub/view/sign_up/sign_up_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as Http;

import '../api/api_checker.dart';
import '../api/api_client.dart';
import '../utils/app_constants.dart';
import '../utils/functions.dart';

class AuthController extends GetxController {
  late SharedPreferences prefs;
  TextEditingController nameCont = TextEditingController(text: "");
  TextEditingController phoneCont = TextEditingController(text: "");
  TextEditingController emailCont = TextEditingController(text: "");
  TextEditingController passCont = TextEditingController(text: '');
  String? token;
  RxBool loading = false.obs;
  LoginModel? user;
  ApiClient api = ApiClient(appBaseUrl: baseUrl);
  ApiChecker apichecker = ApiChecker();
  //var auth = Get.find<AuthController>();
  @override
  Future<void> onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
  }

  Future getuserDetail() async {
    tokenMain = prefs.getString(AppConstants().token);
    token = prefs.getString(AppConstants().token);
    api.updateHeader(token ?? "");
    print(
        "This is AppConstant.userdata=================${jsonDecode(prefs.getString(AppConstants().userdata)!)}");
    try {
      user = LoginModel.fromJson(
          jsonDecode(prefs.getString(AppConstants().userdata)!));
    } catch (e) {
      Get.offAll(LoginScreen());
      print(e);
    }
    update();
  }

  Future<Widget> checkUserLoggedIn() async {
    final SharedPreferences prefss = await SharedPreferences.getInstance();
    bool isLogin = (prefss.get(AppConstants().userdata) == null ? false : true);
    if (isLogin) {
      await getuserDetail();
      return const HomeScreen();
    } else {
      return LoginScreen();
    }
  }

  Future login() async {
    //loading.value = true;
    Response response = await api.postData(
        "api/login",
        {
          "email": emailCont.text,
          "password": passCont.text,
        },
        showdialog: false);
    print(response.statusCode);
    if (response == null) {
      errorAlert('Check your internet connection.');
    } else if (response.statusCode == 200) {
      await prefs.setString(
          AppConstants().token, response.body["access_token"]);
      onLoginSuccess(response.body);
      //Get.offAll(HomeScreen());
      //loading.value = false;
    } else {
      errorAlert('Something went wrong\nPlease try again!');
    }
    //loading.value = false;
  }

  // Future updateAvailability(Timings timing, String day) async {
  //   loading.value = true;
  //   if (user!.availability!.any((element) => element.day == day)) {
  //     user?.availability
  //         ?.firstWhere((element) => element.day == day)
  //         .timings
  //         ?.add(timing);
  //   } else {
  //     user?.availability?.add(Availability(day: day, timings: [timing]));
  //   }
  //
  //   update();
  //   Response response = await api.postWithForm(
  //     "api/doctorAvailability",
  //     {
  //       "user_id": user?.userId,
  //       "availability":
  //           user?.availability?.map((v) => jsonEncode(v.toJson())).toList(),
  //       "role_id": user?.roleId,
  //     },
  //   );
  //   print("heyyyy${response.body}");
  //   if (response == null) {
  //     errorAlert('Check your internet connection.');
  //   } else if (response.statusCode == 200) {
  //     onLoginSuccess(response.body);
  //   } else {
  //     errorAlert('Something went wrong\nPlease try again!');
  //   }
  //   loading.value = false;
  // }

  void onLoginSuccess(Map<String, dynamic> value) async {
    await prefs.setString(AppConstants().userdata, jsonEncode(value));
    await getuserDetail();
    update();
    Get.offAll(HomeScreen());
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(AppConstants().token);
    prefs.remove(AppConstants().userdata);
    Get.offAll(() => const LoginScreen());
  }
}
