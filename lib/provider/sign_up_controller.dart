import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:saffron_hub/consts/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login.dart';
import '../models/register_model.dart';

class SignUpController extends ChangeNotifier {
  Dio? dio = Dio();
  var authStatus;
  String verificationId = "";
  int? _resendToken;

  var auth = FirebaseAuth.instance;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailControllerL = TextEditingController();
  TextEditingController passwordControllerL = TextEditingController();

  final Future<SharedPreferences> _shareP = SharedPreferences.getInstance();

  Future<RegistrationModel?> getUserData() async {
    log('Started');
    final Map<String, dynamic> data = {
      'fullName': nameController.text,
      'phone': phoneController.text,
      'email': emailController.text,
      'password': passwordController.text,
    };

    final formData = FormData.fromMap(data);
    const url = "${AppConstants.baseUrl}signUp";

    try {
      debugPrint('API Call 1');
      Response response = await dio!.post(
        url,
        data: formData,
      );
      debugPrint('API Call 2');
      if (response.statusCode == 200) {
        print('Success - ${response.data}');
        //  debugPrint(
        //   'statusCode - ${response.statusCode} - Response - ${response.data}');
        return RegistrationModel.fromJson(response.data);
      }
      throw response.data;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<LoginModel?> getLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? "";

    const url = "${AppConstants.baseUrl}login";
    try {
      var body = FormData.fromMap({
        'email': emailControllerL.text,
        'password': passwordControllerL.text,
      });
      final response = await dio!.post(url,
          data: body,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        if (response.data['status']) {
          print('okkk');
          print(response);
          LoginModel? loginModel = LoginModel.fromJson(response.data);
          return loginModel;
        } else if (response.data['status'] == false) {
          print("${response.data['status']}:${response.data['message']}");
          return null;
        }
        prefs.setString("token", response.data["access_token"]);
        return null;
      }
    } on DioError catch (e) {
      print(e.toString());
    }
  }

  verifyPhone(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 30),
      phoneNumber: "+92$phoneNumber",
      verificationCompleted: (AuthCredential authCredential) async {
        await auth.signInWithCredential(authCredential).then((value) {
          print("verficationCompleted  :  Logged in");
          // Get.offAll(() => OtpVerifyCodeScreen);
        });
      },
      // verificationFailed: (authError) {},
      verificationFailed: (FirebaseAuthException exception) {
        // LoadingDialog().dismiss();
        print(exception.message);
        // getPrefix.Get.snackbar("Error verifyNumber",
        //     "Please check if your phone number is right. ${exception.message}");
      },
      codeSent: (String id, int? forceResend) {
        verificationId = id;
        _resendToken = forceResend;
        // authStatus.value = "Phone number verify";
      },
      codeAutoRetrievalTimeout: (String id) {
        verificationId = id;
      },
    );
  }

  verifyOTP(String otp) async {
    var credential = await auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: otp));
    if (credential.user != null) {}
  }
}

// Future<SignUpBodyModel> registration(SignUpBodyModel signUpBodyModel) async {
//   _isLoading = true;
//   Response response = await authRepo.registration(signUpBodyModel);
//   if (response.statusCode == 200) {
//     response.body.authRepo.saveUserToken(response.body["token"]);
//     signUpBodyModel.status = true;
//     signUpBodyModel.message = "User Registered Successfully.";
//     authRepo.getUserToken();
//   } else {
//     signUpBodyModel.status = false;
//     signUpBodyModel.message = "Registration failed.";
//   }
//   _isLoading = true;
//   update();
//   return signUpBodyModel;
// }
