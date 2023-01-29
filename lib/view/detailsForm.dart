import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../components/custom_card/custom_card.dart';
import '../components/custom_text/text.dart';
import '../components/search_text_field.dart';
import '../controller/home_controller.dart';

class DetailsForm extends StatelessWidget {
  DetailsForm({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(
          text: "Customer Details",
          fontSize: 25.sp,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            CustomText(
              text: "First Name",
            ),
            SizedBox(height: 5.h),
            SearchTextField(
              controller: homeController.firstName,
              hintText: "First name",
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: "Last Name",
            ),
            SizedBox(height: 5.h),
            SearchTextField(
              controller: homeController.lastName,
              hintText: "Last name",
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: "E-mail",
            ),
            SizedBox(height: 5.h),
            SearchTextField(
              controller: homeController.emailName,
              hintText: "E-mail",
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: "Address",
            ),
            SizedBox(height: 5.h),
            SearchTextField(
              controller: homeController.address,
              hintText: "Address",
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: "Description",
            ),
            SizedBox(height: 5.h),
            SearchTextField(
              controller: homeController.description,
              height: 150,
              hintText: "Write something",
              maxLines: 10,
            ),
            SizedBox(height: 100.h),
            InkWell(
              onTap: () {
                if (homeController.firstName.text.isEmpty ||
                    homeController.lastName.text.isEmpty ||
                    homeController.emailName.text.isEmpty ||
                    homeController.address.text.isEmpty ||
                    homeController.description.text.isEmpty) {
                  Get.snackbar("Fill", "Please fill all Fields");
                  print("good");
                }else{
                  showDialog<void>(
                    context: context,
                    barrierDismissible: true, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: CustomText(
                            text:
                            'Your request send to the vendor, Vendor reply via E-mail shortly',
                            fontSize: 18.sp,
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Get.close(2);
                              //homeController.checkout();
                              // Navigator.pushNamed(context, HomeScreen.id);
                            },
                          ),
                        ],
                      );
                    },
                  );}
              },
              child: CustomCard(
                height: 50.h,
                cardRadius: 10,
                width: double.maxFinite,
                cardColor: Colors.blueGrey,
                cardChild: Center(
                  child: CustomText(
                    text: "Continue",
                    fontSize: 20.sp,
                    fontColor: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h,),
          ],
        ),
      ),
    );
  }
}
