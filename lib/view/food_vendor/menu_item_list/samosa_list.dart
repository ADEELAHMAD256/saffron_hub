import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saffron_hub/models/food_vendor_model.dart';

import '../../../components/custom_card/custom_card.dart';
import '../../../components/custom_text/text.dart';
import '../../../provider/food_vendors_provider.dart';
import '../bottom_sheet/custom_bottom_sheet.dart';

class SamosaList extends StatelessWidget {
  final String? image;
  final String? imageTitle;
  FoodVendorsProvider? foodVendorsProvider;

  SamosaList({super.key, @required this.image, @required this.imageTitle});

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
          // itemCount: foodVendorsProvider!
          //     .foodVendorModel.data![0].foodVendorItems!.length,
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
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        bottomLeft: Radius.circular(10.r),
                      ),
                      child: Image.network(
                        image!,
                        height: MediaQuery.of(context).size.height,
                        width: 118.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h, left: 20.w),
                      child: CustomText(
                        text: imageTitle,
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

// class SamosaList {
//   String itemName;
//   String itemImage;
//   SamosaList({required this.itemImage, required this.itemName});
// }
//
// List<SamosaList> samosaList = [
//   SamosaList(
//     itemName: "Chicken Samosa",
//     itemImage: "assets/images/sc.png",
//   ),
//   SamosaList(
//     itemName: "Vegetable Samosa",
//     itemImage: "assets/images/sb.png",
//   ),
// ];
