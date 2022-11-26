import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saffron_hub/components/custom_card/custom_card.dart';
import 'package:saffron_hub/components/custom_text/text.dart';
import 'package:saffron_hub/consts/const_colors.dart';
import '../../models/restaurants_list_model.dart';
import '../../provider/home_provider.dart';

class SendEmailScreen extends StatefulWidget {
  static const String id = "SendEmailScreen";
  const SendEmailScreen({Key? key}) : super(key: key);

  @override
  State<SendEmailScreen> createState() => _SendEmailScreenState();
}

class _SendEmailScreenState extends State<SendEmailScreen> {
  late HomeProvider homeProvider;
  final _dio = Dio();
  RestaurantsListModel? vendor;

  Future sendEmail({
    required String to,
    required String from,
    required String subject,
    required String message,
  }) async {
    final serviceId = "service_lwmv59n";
    final templateId = "template_xuq07or";
    final userId = "xqzVxqu8djX8Xd0FAvE0Q";
    const ulr = "https://api.emailjs.com/api/v1.0/email/send";
    final response = await _dio.post(ulr,
        queryParameters: {
          "origin": "http://localhost",
          "Content-Type": "application/json"
        },
        data: jsonEncode({
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": userId,
          "template_parameter": {
            "user_email": from,
            "user_subject": subject,
            "user_message": message,
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "To",
                    fontSize: 20.sp,
                  ),
                  SizedBox(height: 7.h),
                  CustomCard(
                    height: 40.h,
                    width: 300.w,
                    cardRadius: 10.r,
                    border: Border.all(color: Colors.black12),
                    cardChild: Padding(
                      padding: EdgeInsets.only(left: 10.w, top: 10.h),
                      child: CustomText(
                        text: vendor!.email!,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  CustomText(
                    text: "From",
                    fontSize: 20.sp,
                  ),
                  SizedBox(height: 7.h),
                  CustomCard(
                    height: 40.h,
                    width: 300.w,
                    cardRadius: 10.r,
                    border: Border.all(color: Colors.black12),
                    cardChild: Center(
                      child: TextField(
                        maxLines: 1,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 14.sp),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 14.sp),
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: 17),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            // contentPadding: EdgeInsets.only(
                            //     left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Enter your email"),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  CustomText(
                    text: "Subject",
                    fontSize: 20.sp,
                  ),
                  SizedBox(height: 7.h),
                  CustomCard(
                    height: 40.h,
                    width: 300.w,
                    cardRadius: 10.r,
                    border: Border.all(color: Colors.black12),
                    cardChild: TextField(
                      maxLines: 1,
                      cursorColor: Colors.black,
                      style: TextStyle(fontSize: 14.sp),
                      decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 14.sp),
                          contentPadding: EdgeInsets.only(left: 10, bottom: 17),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          // contentPadding: EdgeInsets.only(
                          //     left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Subject"),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  CustomText(
                    text: "Message",
                    fontSize: 20.sp,
                  ),
                  SizedBox(height: 7.h),
                  CustomCard(
                    height: 250.h,
                    width: 300.w,
                    cardRadius: 10.r,
                    border: Border.all(color: Colors.black12),
                    cardChild: TextField(
                      maxLines: null,
                      cursorColor: Colors.black,
                      style: TextStyle(fontSize: 14.sp),
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 14.sp),
                          contentPadding: EdgeInsets.only(left: 10, bottom: 17),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          // contentPadding: EdgeInsets.only(
                          //     left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Write your message here"),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  CustomCard(
                    height: 50.h,
                    width: 300.w,
                    cardRadius: 10.r,
                    cardColor: kYellow,
                    cardChild: Center(
                        child: CustomText(
                      text: "Send",
                      fontColor: Colors.white,
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
