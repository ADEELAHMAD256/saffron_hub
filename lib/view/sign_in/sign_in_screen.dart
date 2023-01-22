import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/custom_text/text.dart';
import '../../components/custom_text_feild.dart';
import '../../consts/const_colors.dart';
import '../../provider/sign_up_controller.dart';
import '../home/home_screen.dart';
import '../sign_up/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<SignUpController>(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 74.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                  child: CustomText(
                    text: "Skip",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    fontColor: kYellow,
                  ),
                ),
              ],
            ),
            CustomText(
              text: "Welcome Back!",
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 50.h),
            SizedBox(height: 50.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: double.maxFinite),
                CustomText(
                  text: "Sign in with your email",
                  fontSize: 14.sp,
                  fontColor: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            CustomTextField(
              hintText: "Email",
              controller: authController.emailControllerL,
              icon: Icons.email_outlined,
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              hintText: "Password",
              controller: authController.passwordControllerL,
              icon: Icons.lock,
            ),
            SizedBox(height: 20.h),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  text: "Forgot password?",
                  fontSize: 14.sp,
                  fontColor: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            GestureDetector(
              onTap: () {
                authController.getLogin().then((value) {
                  if (value != null) {
                    // UserPreferences.setUserId('${value.userId}');

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('sign up successfully'),
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } else {
                    Navigator.of(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Enter valid data'),
                    ));
                  }
                });
              },
              child: CustomCard(
                height: 48.h,
                width: 335.w,
                cardRadius: 10.r, cardColor: kYellow,
                // cardColor: AppColors.kMainColor,
                // borderRadius: BorderRadius.circular(10.r),
                cardChild: Padding(
                  padding: EdgeInsets.all(10.0.r),
                  child: Center(
                    child: CustomText(
                      text: "Sign In",
                      fontColor: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h),
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 16.sp),
                  children: <TextSpan>[
                    const TextSpan(text: 'Donn’t have an account? '),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => SignUpScreen()),
                        text: 'Sign Up ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent)),
                  ],
                ),
                // textScaleFactor: 0.5,
              ),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
