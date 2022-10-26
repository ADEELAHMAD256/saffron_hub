import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saffron_hub/consts/const_colors.dart';
import 'package:saffron_hub/view/vendors/vendors_list_model.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/custom_text/text.dart';
import '../food_vendor/food_vendor_screen.dart';

class VendorsScreen extends StatelessWidget {
  static const String id = "VendorsScreen";
  const VendorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          text: "Vendors",
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontColor: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomCard(
              height: 45.h,
              width: 335.w,
              cardRadius: 10,
              border: Border.all(color: Colors.black12),
              cardColor: Colors.transparent,
              cardChild: TextField(
                cursorColor: kGray,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search_sharp,
                    color: kYellow,
                  ),
                  hintText: "Search",
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, FoodVendorScreen.id),
                child: ListView.builder(
                  itemCount: vendorsItemList.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      SizedBox(height: 20),
                      CustomCard(
                        height: 272.h,
                        width: 335.w,
                        cardRadius: 20,
                        cardColor: Colors.white,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              vendorsItemList[index].vendorsItemImage,
                              fit: BoxFit.fitWidth,
                              // height: 180.h,
                            ),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 0.5,
                                      spreadRadius: 1.5,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10.h),
                                      CustomText(
                                        text: vendorsItemList[index]
                                            .vendorsItemText,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(height: 7.h),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.phone_in_talk_outlined,
                                            size: 12.sp,
                                          ),
                                          SizedBox(width: 10.w),
                                          CustomText(
                                            text: vendorsItemList[index]
                                                .vendorsPhoneNumber,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 7.h),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            size: 12.sp,
                                          ),
                                          SizedBox(width: 10.w),
                                          CustomText(
                                            text: vendorsItemList[index]
                                                .vendorsAddress,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 7.h),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
