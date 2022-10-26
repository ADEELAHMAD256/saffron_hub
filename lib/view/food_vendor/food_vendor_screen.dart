import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saffron_hub/consts/const_colors.dart';
import 'package:saffron_hub/view/food_vendor/biryani_list.dart';
import 'package:saffron_hub/view/food_vendor/chicken_list.dart';
import 'package:saffron_hub/view/food_vendor/food_menu_items_list.dart';
import 'package:saffron_hub/view/food_vendor/meals_list.dart';
import 'package:saffron_hub/view/food_vendor/samosa_list.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/custom_text/text.dart';

class FoodVendorScreen extends StatefulWidget {
  static const String id = "FoodVendorScreen";
  const FoodVendorScreen({Key? key}) : super(key: key);

  @override
  State<FoodVendorScreen> createState() => _FoodVendorScreenState();
}

class _FoodVendorScreenState extends State<FoodVendorScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 330.h,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0.0,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    child: Image.asset(
                      "assets/images/f-c.jpg",
                      height: 265.h,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 216.h,
                  child: CustomCard(
                    height: 97.h,
                    width: 335.w,
                    cardRadius: 10,
                    cardColor: Colors.white,
                    shadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.3),
                        blurRadius: 2,
                        spreadRadius: 1,
                      ),
                    ],
                    cardChild: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Kitchen Logic",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 3.h),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 10.sp,
                                color: kLightGray,
                              ),
                              SizedBox(width: 12.w),
                              CustomText(
                                text: "Majeedhee Magu Rd, Malé, Maldives",
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                fontColor: kLightGray,
                              )
                            ],
                          ),
                          SizedBox(height: 3.h),
                          Row(
                            children: [
                              Icon(
                                Icons.phone_in_talk_outlined,
                                size: 10.sp,
                                color: kLightGray,
                              ),
                              SizedBox(width: 12.w),
                              CustomText(
                                text: "03017896541",
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                fontColor: kLightGray,
                              )
                            ],
                          ),
                          SizedBox(height: 3.h),
                          Row(
                            children: [
                              Icon(
                                Icons.email,
                                size: 10.sp,
                                color: kLightGray,
                              ),
                              SizedBox(width: 12.w),
                              CustomText(
                                text: "dummy@email.com",
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                fontColor: kLightGray,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Introduction",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 10.h),
                  CustomText(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    fontColor: Colors.black.withOpacity(0.6),
                  ),
                  SizedBox(height: 20.h),
                  CustomText(
                    text: "Foods Menu",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(
                    height: 45.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tabBarItems.length,
                      itemBuilder: (context, index) => Row(
                        children: [
                          SizedBox(width: 3.w),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            child: CustomCard(
                              height: 37.h,
                              width: 81.w,
                              cardRadius: 5,
                              cardColor: _selectedIndex == index
                                  ? kYellow
                                  : Colors.white,
                              shadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 2,
                                    spreadRadius: 0.2,
                                    offset: Offset(0, 0))
                              ],
                              cardChild: Center(
                                child: CustomText(
                                  text: tabBarItems[index].itemName,
                                  fontSize: 12.sp,
                                  fontColor: _selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: tabBarItems[_selectedIndex].itemName,
                        ),
                        _selectedIndex == 0
                            ? Expanded(
                                child: SamosaList(),
                              )
                            : _selectedIndex == 1
                                ? Expanded(
                                    child: BiryaniList(),
                                  )
                                : _selectedIndex == 2
                                    ? Expanded(child: MealsList())
                                    : Expanded(child: ChickenList()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      // color: Colors.transparent,
      child: Column(
        children: [
          SizedBox(
            height: 250.h,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: ClipPath(
                    clipper: CustomShape(),
                    child: Image.asset(
                      "assets/images/sb.png",
                      fit: BoxFit.fitWidth,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Chicken Samosa",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 3.h),
                CustomText(
                  text: "Kitchen Logic",
                  fontSize: 14.sp,
                  fontColor: kYellow,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 10.h),
                CustomText(
                  text:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500",
                  fontSize: 14.sp,
                  fontColor: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 30.h),
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
