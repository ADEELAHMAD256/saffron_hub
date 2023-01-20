import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saffron_hub/components/custom_card/custom_card.dart';
import 'package:saffron_hub/components/custom_text/text.dart';
import 'package:saffron_hub/components/search_text_field.dart';
import 'package:saffron_hub/view/home/home_screen.dart';

class CartVerify extends StatelessWidget {
  const CartVerify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(
          text: "Customter Details",
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
              hintText: "First name",
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: "Last Name",
            ),
            SizedBox(height: 5.h),
            SearchTextField(
              hintText: "Last name",
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: "E-mail",
            ),
            SizedBox(height: 5.h),
            SearchTextField(
              hintText: "E-mail",
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: "Description",
            ),
            SizedBox(height: 5.h),
            SearchTextField(
              height: 150,
              hintText: "Write something",
              maxLines: 10,
            ),
            SizedBox(height: 100.h),
            InkWell(
              onTap: () => showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: SingleChildScrollView(
                      child: CustomText(
                        text: 'Your request send to the vendor, Vendor reply via E-mail shortly',
                        fontSize: 18.sp,
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Navigator.pushNamed(context, HomeScreen.id);
                        },
                      ),
                    ],
                  );
                },
              ),
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
            )
          ],
        ),
      ),
    );
  }
}
