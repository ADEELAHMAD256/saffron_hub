import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saffron_hub/models/vendors_model.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/custom_text/text.dart';
import '../../../consts/const_colors.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({
    Key? key,
    required this.vendorName,
    required this.item,
  }) : super(key: key);
  var vendorName;
  var item;
  // FoodVendorItems item;
  Widget build(BuildContext context) {
    return SizedBox(
      height: 440.h,
      // color: Colors.transparent,
      child: Column(
        children: [
          SizedBox(
            height: 280.h,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: ClipPath(
                    clipper: CustomShape(),
                    // child: Image.asset("assets/images/sb.png",
                    child: Image.network(
                      '${item.image}',
                      fit: BoxFit.cover,
                      height: 240.h,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                Positioned(
                  top: 20.h,
                  left: 325.w,
                  child: CustomCard(
                    height: 30.h,
                    width: 30.w,
                    cardRadius: 5,
                    cardColor: Colors.white,
                    cardChild: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.close,
                        size: 30.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: '${item.name}', // "Chicken Samosa",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 3.h),
                    CustomText(
                      text: "${vendorName}", //  "Kitchen Logic",
                      fontSize: 14.sp,
                      fontColor: kYellow,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 10.h),
                    CustomText(
                      text: '${item.description}', //
                      // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500",
                      fontSize: 14.sp,
                      fontColor: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

// class CurvedBottomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // I've taken approximate height of curved part of view
//     // Change it if you have exact spec for it
//     final roundingHeight = size.height * 2 / 3;
//
//     // this is top part of path, rectangle without any rounding
//     final filledRectangle =
//         Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);
//
//     // this is rectangle that will be used to draw arc
//     // arc is drawn from center of this rectangle, so it's height has to be twice roundingHeight
//     // also I made it to go 5 units out of screen on left and right, so curve will have some incline there
//     final roundingRectangle = Rect.fromLTRB(
//         -2, size.height - roundingHeight * 2, size.width + 2, size.height);
//
//     final path = Path();
//     path.addRect(filledRectangle);
//
//     // so as I wrote before: arc is drawn from center of roundingRectangle
//     // 2nd and 3rd arguments are angles from center to arc start and end points
//     // 4th argument is set to true to move path to rectangle center, so we don't have to move it manually
//     path.arcTo(roundingRectangle, pi, -pi, true);
//     path.close();
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     // returning fixed 'true' value here for simplicity, it's not the part of actual question, please read docs if you want to dig into it
//     // basically that means that clipping will be redrawn on any changes
//     return true;
//   }
// }
