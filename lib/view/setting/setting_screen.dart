import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/custom_text/text.dart';

class AccountSettingScreen extends StatelessWidget {
  static const String id = "AccountSettingScreen";

  const AccountSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 15.sp,
            color: Colors.black,
          ),
        ),
        title: CustomText(
          text: "Settings",
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontColor: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              ListTile(
                minLeadingWidth: 10,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                leading: Icon(
                  Icons.email,
                  size: 16.sp,
                  color: Colors.black,
                ),
                title: GestureDetector(
                  onTap: () {
                  launch(
                      'https://www.saffronhub.org/contact-us/');
                },
                  child: CustomText(
                    text: "Contact us",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                ),
                onTap: () {
                  launch(
                      'https://www.saffronhub.org/contact-us/');
                },
              ),
              Divider(),
              ListTile(
                minLeadingWidth: 10,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                leading: CircleAvatar(
                  radius: 8.sp,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.question_mark_rounded,
                    size: 16.sp,
                    color: Colors.white,
                  ),
                ),
                title: CustomText(
                  text: "FAQ",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                ),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                minLeadingWidth: 10,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                leading: Image.asset("assets/images/policy.png"),
                title: GestureDetector(
                  onTap: () {
                    launch(
                        'https://www.freeprivacypolicy.com/live/a4a924e1-5942-4460-b938-f72660248465');
                  },
                  child: CustomText(
                    text: "Privacy Policy",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                ),
                onTap: () {
                  launch(
                      'https://www.freeprivacypolicy.com/live/a4a924e1-5942-4460-b938-f72660248465');
                },
              ),
              Divider(),
              ListTile(
                minLeadingWidth: 10,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                leading: Image.asset("assets/images/about.png"),
                title: GestureDetector(
                  onTap: () {
                    launch('https://www.saffronhub.org/about-us/');
                  },
                  child: CustomText(
                    text: "About",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                ),
                onTap: () {
                  launch('https://www.saffronhub.org/about-us/');
                },
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
