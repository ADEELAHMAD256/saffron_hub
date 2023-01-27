import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:provider/provider.dart';
import 'package:saffron_hub/consts/const_colors.dart';
import 'package:saffron_hub/view/home/home_screen.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/custom_text/text.dart';
import '../../components/custom_text_feild.dart';
import '../../provider/sign_up_controller.dart';
import '../sign_in/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<SignUpController>(context);
    String? finalNumber;
    PhoneNumber? number = PhoneNumber(isoCode: 'PK');
    String? enteredOtp;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 74.h),
            CustomText(
              text: "Create account",
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 5.h),
            CustomText(
              text:
                  "Please enter your information below in order to create your account",
              fontSize: 14.sp,
              fontColor: Colors.black.withOpacity(0.5),
            ),
            SizedBox(height: 40.h),
            CustomText(
              text: "Name",
              fontSize: 14.sp,
              fontColor: Colors.black.withOpacity(0.5),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              hintText: "Enter your full name",
              controller: authController.nameController,
              icon: Icons.person,
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: "Phone Number",
              fontSize: 14.sp,
              fontColor: Colors.black.withOpacity(0.5),
            ),
            SizedBox(height: 10.h),
            Container(
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
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 5.h,
                ),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    // setState(() {});
                    finalNumber = number.phoneNumber;

                    log(finalNumber.toString());
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  cursorColor: Colors.black12,
                  textFieldController: authController.phoneController,
                  hintText: "Mobile Number",
                  inputDecoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your phone number"),
                  keyboardType: TextInputType.phone,
                  initialValue: number,
                  formatInput: false,
                  selectorConfig: const SelectorConfig(
                    showFlags: true,
                    setSelectorButtonAsPrefixIcon: true,
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ),
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: "Email Address",
              fontSize: 14.sp,
              fontColor: Colors.black.withOpacity(0.5),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              hintText: "Enter your email",
              controller: authController.emailController,
              icon: Icons.email_outlined,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: "Password",
              fontSize: 14.sp,
              fontColor: Colors.black.withOpacity(0.5),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              hintText: "*************",
              controller: authController.passwordController,
              icon: Icons.lock,
            ),
            SizedBox(height: 30.h),
            GestureDetector(
              onTap: () {
                // UserPreferences.setUserId('${value.userId}');

                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25.0))),
                    backgroundColor: Colors.white,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(height: 30.h),
                              CustomText(
                                text: "Verify Number",
                                fontSize: 36.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 5.h),
                              CustomText(
                                text:
                                    "Please enter the OTP send to your \nmobile number  ${authController.phoneController.text}",
                                fontSize: 12.sp,
                                fontColor: Colors.black.withOpacity(0.5),
                              ),
                              SizedBox(height: 10.h),
                              PinCodeTextField(
                                controller: authController.otpController,
                                pinBoxRadius: 10,
                                maxLength: 6,
                                keyboardType: TextInputType.number,
                                highlightPinBoxColor: Colors.black,
                                pinBoxColor: const Color(0xffC4C4C4),
                                hasTextBorderColor: Color(0xff202020),
                                defaultBorderColor: Color(0xffc4c4c4),
                                pinBoxWidth: 50.w,
                                pinBoxHeight: 50.h,
                                onTextChanged: (text) {},
                                onDone: (text) {
                                  // setState(() {
                                  //   enteredOtp == null ? "-" : text;
                                  // });

                                  log(text);
                                },
                                pinTextStyle: TextStyle(
                                    color: enteredOtp == null
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.03),
                                pinTextAnimatedSwitcherTransition:
                                    ProvidedPinBoxTextAnimation
                                        .awesomeTransition,
                                pinTextAnimatedSwitcherDuration:
                                    const Duration(milliseconds: 300),
                              ),
                              SizedBox(height: 35.h),
                              GestureDetector(
                                onTap: () {
                                  authController.verifyOTP(
                                      authController.otpController.text);
                                  authController.getUserData().then((value) {
                                    if (value != null) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen()));
                                    } else {
                                      Navigator.of(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text('Enter valid data'),
                                      ));
                                    }
                                  });
                                },
                                child: CustomCard(
                                  height: 48.h,
                                  width: 335.w,
                                  cardColor: kYellow,
                                  cardRadius: 10.r,
                                  cardChild: Padding(
                                    padding: EdgeInsets.all(10.0.r),
                                    child: Center(
                                      child: CustomText(
                                        text: "Sign Up",
                                        fontColor: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 45.h),
                              CustomText(
                                text: "Haven't received OTP yet?",
                                fontColor: Colors.black.withOpacity(0.5),
                                fontSize: 14.sp,
                              ),
                              SizedBox(height: 5.h),
                              CustomText(
                                text: "Resend OTP?",
                                fontColor: kYellow,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                              ),
                              SizedBox(height: 35.h),
                            ],
                          ),
                        ));
              },
              child: CustomCard(
                height: 48.h,
                width: 335.w, cardRadius: 10.r, cardColor: kYellow,
                // cardColor: AppColors.kMainColor,
                // borderRadius: BorderRadius.circular(10.r),
                cardChild: Padding(
                  padding: EdgeInsets.all(10.0.r),
                  child: Center(
                    child: CustomText(
                      text: "Sign Up",
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
                    const TextSpan(text: 'Already have an account? '),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen())),
                        text: 'Sign In ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent)),
                  ],
                ),
                // textScaleFactor: 0.9,
              ),
            ),
            SizedBox(height: 15.h)
          ],
        ),
      ),
    );
  }
}
