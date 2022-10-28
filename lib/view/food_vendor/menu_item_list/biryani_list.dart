import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/custom_text/text.dart';
import '../bottom_sheet/custom_bottom_sheet.dart';

class BiryaniList extends StatelessWidget {
  const BiryaniList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: InkWell(
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (builder) => CustomBottomSheet(),
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) => Column(
            children: [
              SizedBox(height: 7.h),
              CustomCard(
                height: 118.h,
                width: 335.w,
                cardRadius: 10,
                cardColor: Colors.white,
                border: Border.all(color: Colors.black12),
                cardChild: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/b.png"),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h, left: 20.w),
                      child: CustomText(
                        text: "Chicken Biryani",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 3.h),
            ],
          ),
        ),
      ),
    );
  }
}
