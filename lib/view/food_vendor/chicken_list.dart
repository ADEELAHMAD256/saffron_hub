import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/custom_card/custom_card.dart';
import '../../components/custom_text/text.dart';

class ChickenList extends StatelessWidget {
  const ChickenList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) => Column(
        children: [
          CustomCard(
            height: 118.h,
            width: 335.w,
            cardRadius: 10,
            cardColor: Colors.white,
            border: Border.all(color: Colors.black12),
            cardChild: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/ch.png"),
                Padding(
                  padding: EdgeInsets.only(top: 16.h, left: 20.w),
                  child: CustomText(
                    text: "Chicken",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
