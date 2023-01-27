import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saffron_hub/CustomContainer.dart';
import 'package:saffron_hub/CustomTextFormFiled.dart';
import 'package:saffron_hub/button.dart';
import 'package:saffron_hub/consts/const_colors.dart';
import 'package:saffron_hub/controller/auth_controller.dart';
import 'package:saffron_hub/view/home/home_screen.dart';
import 'package:saffron_hub/view/sign_up/sign_up_screen.dart';
import 'package:validators/validators.dart';

import '../../components/custom_text/text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isCorrect = false;
  bool showLoading = false;
  var auth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
          child: AnimatedPadding(
        padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 127.h),
        duration: const Duration(seconds: 100),
        child: Column(
          children: [
            const CustomText(
              text: "Welcome back",
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0.h, bottom: 45.h),
              child: SizedBox(
                width: double.infinity,
                height: 40.h,
                child: const CustomText(
                  text: ".",
                  // textAlign: TextAlign.center,
                  //maxLines: 2,
                  fontColor: Color(0xff677294),
                  fontSize: 14,
                ),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              cursorColor: const Color(0xffE76880),
              controller: auth.emailCont,
              onChanged: (val) {
                setState(() {
                  isCorrect = isEmail(val);
                });
              },
              decoration: InputDecoration(
                  suffixIcon: isCorrect == true
                      ? const Icon(
                          Icons.check,
                          color: Color(0xff677294),
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
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
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 4.h, horizontal: 20.w),
                  hintText: "Enter your Email",
                  hintStyle: TextStyle(
                      fontFamily: "Rubik",
                      color: const Color(0xff677294),
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0.h, bottom: 32.h),
              child: CustomTextFormFiledPassword(
                hintText: 'Enter your Password',
                controller: auth.passCont,
              ),
            ),
            MyCustomButton(
                height: 54.h,
                width: double.infinity.w,
                buttonColor: kYellow,
                text: "Login",
                textColor: Color(0xffFFFFFF),
                fontSize: 18.sp,
                onPressed: () async {
                  // setState(() {
                  //
                  //   //showLoading = true;
                  // });
                  await auth.login();
                }),

            SizedBox(height: 20.h),
            // GestureDetector(
            //   onTap: () {
            //     showModalBottomSheet(
            //         context: context,
            //         isDismissible: false,
            //         enableDrag: false,
            //         isScrollControlled: true,
            //         shape: const RoundedRectangleBorder(
            //             borderRadius: BorderRadius.only(
            //                 topLeft: Radius.circular(30),
            //                 topRight: Radius.circular(30))),
            //         builder: (context) => const SingleChildScrollView(
            //             child: ForgotPassword()));
            //   },
            //   child: CustomText(
            //     text: "Forgot password",
            //     fontColor: Color(0xff96CCD5),
            //     fontSize: 14.sp,
            //     fontWeight: FontWeight.w400,
            //   ),
            // ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Don’t have an account? ",
                  fontColor: Color(0xff96CCD5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                GestureDetector(
                    child: CustomText(
                      text: "Join us",
                      fontColor: Color(0xff96CCD5),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    onTap: () {
                      Get.off(SignUpScreen());
                    }),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                GestureDetector(
                    child: CustomText(
                      text: "Skip",
                      fontColor: Color(0xff96CCD5),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    onTap: () {
                      Get.off(HomeScreen());
                    }),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
