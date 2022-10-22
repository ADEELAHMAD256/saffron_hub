import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saffron_hub/view/search/horizontal_list_item_data.dart';
import 'package:saffron_hub/view/vendors/vendors_list_model.dart';

import '../../consts/const_colors.dart';
import '../../custom_widgets/custom_card/custom_card.dart';
import '../../custom_widgets/custom_text/text.dart';

class SearchScreen extends StatelessWidget {
  static const String id = "SearchScreen";
  const SearchScreen({Key? key}) : super(key: key);

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
          text: "Search",
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontColor: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 20.h),
            CustomText(
              text: "2 Vendors with “Samosa” ",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: vendorsItemList.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Container(
                      height: 182.h,
                      width: 335.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: Image.asset(
                        vendorsItemList[index].vendorsItemImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CustomText(
                      text: vendorsItemList[index].vendorsItemText,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        Icon(
                          Icons.phone_in_talk_outlined,
                          size: 12.sp,
                        ),
                        SizedBox(width: 10.w),
                        CustomText(
                          text: vendorsItemList[index].vendorsPhoneNumber,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 12.sp,
                        ),
                        SizedBox(width: 10.w),
                        CustomText(
                          text: vendorsItemList[index].vendorsAddress,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 78.h,
                      child: ListView.builder(
                        itemCount: horizontalListItem.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Row(
                          children: [
                            SizedBox(width: 1.5.w),
                            CustomCard(
                              height: 75.h,
                              width: 193.w,
                              cardRadius: 5,
                              cardColor: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 0.4,
                                  blurRadius: 1,
                                ),
                              ],
                              cardChild: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomCard(
                                      height: 60.h,
                                      width: 60.w,
                                      cardRadius: 3,
                                      cardChild: Image.asset(
                                        horizontalListItem[index].itemImage,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Container(
                                      margin: EdgeInsets.only(top: 6.h),
                                      width: 100.w,
                                      child: CustomText(
                                        text:
                                            horizontalListItem[index].itemName,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
