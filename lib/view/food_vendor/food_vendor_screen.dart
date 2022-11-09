import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:saffron_hub/consts/const_colors.dart';
import 'package:saffron_hub/view/food_vendor/menu_item_list/biryani_list.dart';
import 'package:saffron_hub/view/food_vendor/menu_item_list/chicken_list.dart';
import 'package:saffron_hub/view/food_vendor/food_menu_items_list.dart';
import 'package:saffron_hub/view/food_vendor/menu_item_list/meals_list.dart';
import 'package:saffron_hub/view/food_vendor/menu_item_list/samosa_list.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/custom_text/text.dart';
import '../../provider/food_vendors_provider.dart';

class FoodVendorScreen extends StatefulWidget {
  static const String id = "FoodVendorScreen";
  const FoodVendorScreen({Key? key}) : super(key: key);

  @override
  State<FoodVendorScreen> createState() => _FoodVendorScreenState();
}

class _FoodVendorScreenState extends State<FoodVendorScreen> {
  late int _selectedIndex = 0;
  FoodVendorsProvider? foodVendorsProvider;
  bool _isInit = true;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      foodVendorsProvider = Provider.of<FoodVendorsProvider>(context);
      await foodVendorsProvider!.getFoodVendorData();
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _isInit
        ? const Center(child: SpinKitSpinningLines(color: kYellow))
        : Scaffold(
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
                        left: 0.0,
                        right: 0.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          child: CarouselSlider.builder(
                            options: CarouselOptions(
                              viewportFraction: 1,
                              disableCenter: false,
                              initialPage: 0,
                              autoPlay: true,
                              reverse: false,
                              height: 270.h,
                              enableInfiniteScroll: true,
                              // autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 3000),
                              pauseAutoPlayOnTouch: true,
                              scrollDirection: Axis.horizontal,
                              pageSnapping: true,
                            ),
                            itemCount: foodVendorsProvider!.foodVendorModel
                                .data![_selectedIndex].sliderImages!.length,
                            itemBuilder: (BuildContext context, int index,
                                    int realIndex) =>
                                Container(
                              margin: EdgeInsets.symmetric(horizontal: 1),
                              child: Image.network(
                                height: 265.h,
                                width: MediaQuery.of(context).size.width,
                                foodVendorsProvider!.foodVendorModel
                                    .data![index].sliderImages![index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 216.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: CustomCard(
                            height: 100.h,
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: foodVendorsProvider!
                                        .foodVendorModel.data![0].name,
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
                                        text: foodVendorsProvider!
                                            .foodVendorModel.data![0].location,
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
                                        text: foodVendorsProvider!
                                            .foodVendorModel.data![0].phone,
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
                                        text: foodVendorsProvider!
                                            .foodVendorModel.data![0].email,
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
                          text: foodVendorsProvider!
                              .foodVendorModel.data![0].description,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          fontColor: Colors.black.withOpacity(0.6),
                        ),
                        SizedBox(height: 10.h),
                        CustomText(
                          text: "Foods Menu",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 5.h),
                        SizedBox(
                          height: 45.h,
                          width: 350.w,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: foodVendorsProvider!
                                .foodVendorModel.data![0].menuList!.length,
                            // itemCount: tabBarItems.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Row(
                              children: [
                                SizedBox(width: 5.w),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = index;
                                    });
                                  },
                                  child: CustomCard(
                                    height: 37.h,
                                    width: 75.w,
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
                                        text: foodVendorsProvider!
                                            .foodVendorModel
                                            .data![index]
                                            .menuList![index]
                                            .menuName,
                                        fontSize: 12.sp,
                                        fontColor: _selectedIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                // SizedBox(width: 8.w),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: foodVendorsProvider!
                                    .foodVendorModel
                                    .data![_selectedIndex]
                                    .menuList![_selectedIndex]
                                    .menuName,
                              ),
                              _selectedIndex == 0
                                  ? Expanded(
                                      child: SamosaList(
                                        image: foodVendorsProvider!
                                            .foodVendorModel
                                            .data![0]
                                            .foodVendorItems![0]
                                            .image,
                                        imageTitle: foodVendorsProvider!
                                            .foodVendorModel
                                            .data![0]
                                            .foodVendorItems![0]
                                            .name,
                                      ),
                                    )
                                  : _selectedIndex == 1
                                      ? Expanded(child: BiryaniList())
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
