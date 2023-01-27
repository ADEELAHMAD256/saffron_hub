import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saffron_hub/button.dart';
import 'package:saffron_hub/components/const.dart';
import 'package:saffron_hub/components/custom_card.dart';
import 'package:saffron_hub/components/custom_text/text.dart';
import 'package:saffron_hub/consts/const_colors.dart';
import 'package:saffron_hub/controller/auth_controller.dart';
import 'package:saffron_hub/view/home/home_screen.dart';
import 'package:saffron_hub/view/sign_in/sign_in_screen.dart';




class DeleteAccountScreen extends StatefulWidget {
  static const String id = "DeleteAccountScreen";
  const DeleteAccountScreen({Key? key}) : super(key: key);

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  String dropdownValue = 'Something was broken';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        CustomText(
                          text: "Delete Account",
                          fontSize: 25.sp,
                          //fontColor: kMainColor,
                        ),
                        SizedBox(height: 20.h),
                        CustomCard(
                          height: 45.h,
                          width: 335.w,
                          cardChild: Center(
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24.sp,
                              elevation: 16,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.sp),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'Something was broken',
                                "I'm not getting any invites",
                                'I have a privacy  concern',
                                'Other',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        CustomCard(
                          height: 250.h,
                          width: 335.w,
                          cardChild: TextFormField(
                            maxLines: null,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15.w,
                                    bottom: 11.h,
                                    top: 11.h,
                                    right: 15.w),
                                hintText: "Why you delete account"),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        MyCustomButton(
                            height: 54.h,
                            width: double.infinity.w,
                            buttonColor: kYellow,
                            text: "Submit",
                            textColor: Color(0xffFFFFFF),
                            fontSize: 18.sp,
                            onPressed: () async {
                              Get.to(Logout(context));
                            })
                        // Center(
                        //   child: Container(
                        //     height: 35.h,
                        //     width: 335.w,
                        //     decoration: BoxDecoration(
                        //         color: kMainColor,
                        //         borderRadius: BorderRadius.circular(40.r)),
                        //     child: ElevatedButton(
                        //       style: ElevatedButton.styleFrom(
                        //           backgroundColor: kMainColor),
                        //       onPressed: () => showDialog(
                        //           context: context,
                        //           builder: (context) => Dialog(
                        //             insetPadding: EdgeInsets.symmetric(
                        //                 horizontal: 30.w, vertical: 150.h),
                        //             child: Padding(
                        //               padding: EdgeInsets.symmetric(
                        //                   vertical: 50.h),
                        //               child: Container(
                        //                 decoration: BoxDecoration(
                        //                     color: Colors.white,
                        //                     borderRadius:
                        //                     BorderRadius.circular(
                        //                         40.r)),
                        //                 child: Column(
                        //                   children: [
                        //                     CustomText(
                        //                       text: "Are you sure?",
                        //                       fontSize: 26.sp,
                        //                       //textAlign: TextAlign.center,
                        //                     ),
                        //                     SizedBox(height: 60.h),
                        //                     Row(
                        //                       mainAxisAlignment:
                        //                       MainAxisAlignment
                        //                           .spaceAround,
                        //                       children: [
                        //                         Container(
                        //                           height: 35.h,
                        //                           width: 120.w,
                        //                           decoration: BoxDecoration(
                        //                               color: kMainColor,
                        //                               borderRadius:
                        //                               BorderRadius
                        //                                   .circular(
                        //                                   15.r)),
                        //                           child: ElevatedButton(
                        //                             style: ElevatedButton
                        //                                 .styleFrom(
                        //                               backgroundColor:
                        //                               kMainColor,
                        //                             ),
                        //                             onPressed: () async {
                        //                               Navigator.of(
                        //                                   context)
                        //                                   .pushAndRemoveUntil(
                        //                                   MaterialPageRoute(
                        //                                     builder:
                        //                                         (context) =>
                        //                                         LoginScreen(),
                        //                                   ),
                        //                                       (Route<dynamic>
                        //                                   route) =>
                        //                                   false);
                        //                             },
                        //                             child: CustomText(
                        //                               text: "Yes",
                        //                               fontSize: 18.sp,
                        //                             ),
                        //                           ),
                        //                         ),
                        //                         Container(
                        //                           height: 35.h,
                        //                           width: 120.w,
                        //                           decoration: BoxDecoration(
                        //                             color: kMainColor,
                        //                             borderRadius:
                        //                             BorderRadius
                        //                                 .circular(15.r),
                        //                           ),
                        //                           child: ElevatedButton(
                        //                               style: ElevatedButton
                        //                                   .styleFrom(
                        //                                 backgroundColor:
                        //                                 kMainColor,
                        //                               ),
                        //                               onPressed: () async {
                        //                                 Navigator.of(
                        //                                     context)
                        //                                     .pushAndRemoveUntil(
                        //                                     MaterialPageRoute(
                        //                                       builder:
                        //                                           (context) =>
                        //                                               HomeScreen(),
                        //                                     ),
                        //                                         (Route<dynamic>
                        //                                     route) =>
                        //                                     false);
                        //                               },
                        //                               child: CustomText(
                        //                                 text: "No",
                        //                                 fontSize: 18.sp,
                        //                               )),
                        //                         ),
                        //                       ],
                        //                     )
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           )),
                        //       child: CustomText(
                        //         text: "Submit",
                        //         fontColor: Colors.white,
                        //         fontSize: 18.sp,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> Logout(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding:
          EdgeInsets.only(left: 20.w, right: 20.w, top: 0.h, bottom: 0.h).r,
          backgroundColor: Color(0xff000000).withOpacity(0.50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: double.infinity.w,
                  height: 167.h,
                  child: Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: Color(0xffFFFFFF),
                    child: Container(
                      padding: EdgeInsets.only(left: 28.w, right: 38.w).r,
                      child:
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 24.h,
                            ),
                            CustomText(
                              text: "Delete my account",
                              //textAlign: TextAlign.left,
                              fontColor: Color(0xff000000),
                              fontSize: 26.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            CustomText(
                              text: "Are you sure you want to delete your account?",
                              //textAlign: TextAlign.left,
                              fontColor: Color(0xff677294),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              height: 34.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(HomeScreen());
                                  },
                                  child: CustomText(
                                    text: "Cancel",
                                    fontColor: Color(0xff96CCD5),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 30.h,
                                ),
                                InkWell(
                                  onTap: () async {
                                    await Get.find<AuthController>().logout();
                                  },
                                  child: CustomText(
                                    text: "Ok",
                                    fontColor: Color(0xff96CCD5),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // child: Container(
          //   child: Image.asset(
          //     'images/check_logo.png',
          //     height: 70.h,
          //     width: 70,
          //   ),
          // ),
        );
      });
}

