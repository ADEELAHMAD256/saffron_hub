import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:saffron_hub/components/custom_card/custom_card.dart';
import 'package:saffron_hub/components/custom_text/text.dart';
import 'package:saffron_hub/consts/const_colors.dart';
import 'package:saffron_hub/models/restaurants_list_model.dart';
import 'package:saffron_hub/provider/home_provider.dart';
import 'package:saffron_hub/view/food_vendor/bottom_sheet/custom_bottom_sheet.dart';
import 'package:saffron_hub/view/send_email_screen/email_screen.dart';

class FoodVendorDetailScreen extends StatefulWidget {
  static const String id = "FoodVendorDetailScreen";
  const FoodVendorDetailScreen({Key? key}) : super(key: key);

  @override
  State<FoodVendorDetailScreen> createState() => _FoodVendorDetailScreenState();
}

class _FoodVendorDetailScreenState extends State<FoodVendorDetailScreen> {
  late int _selectedIndex = 0;
  late String _selectedMenu = '';
  late HomeProvider homeProvider;
  bool _isInit = true;
  int? vendorIndex;
  late RestaurantsListModel vendor;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      homeProvider = Provider.of<HomeProvider>(context);
      // await homeProvider!.getFoodVendorData();
      vendorIndex = homeProvider.currentVendor;
      vendor = homeProvider.restaurantsListModel![vendorIndex!];
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    // getCurrentVendor();
  }

  @override
  Widget build(BuildContext context) {
    return _isInit
        ? const Center(child: SpinKitSpinningLines(color: kYellow))
        : Scaffold(
            body: Center(
              // child: Column(
              //   children: [
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    key: UniqueKey(),
                    child: SizedBox(
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
                                  // bottomLeft: Radius.circular(10),
                                  // bottomRight: Radius.circular(10),
                                  ),
                              child: CustomCard(
                                height: 250.h,
                                width: MediaQuery.of(context).size.width,
                                cardRadius: 0, //10
                                cardColor: kLightGray,
                                cardChild: ClipRRect(
                                  // borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    vendor.sliderImages!.first,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),

                              // CarouselSlider.builder(
                              //   options: CarouselOptions(
                              //     viewportFraction: 1,
                              //     disableCenter: false,
                              //     initialPage: 0,
                              //     autoPlay: true,
                              //     reverse: false,
                              //     height: 270.h,
                              //     enableInfiniteScroll: true,
                              //     // autoPlayInterval: const Duration(seconds: 3),
                              //     autoPlayAnimationDuration:
                              //         const Duration(milliseconds: 3000),
                              //     pauseAutoPlayOnTouch: true,
                              //     scrollDirection: Axis.horizontal,
                              //     pageSnapping: true,
                              //   ),
                              //   itemCount: vendor.sliderImages!.length,
                              //   // foodVendorsProvider!.foodVendorModel.data![_selectedIndex].sliderImages!.length,
                              //   itemBuilder: (BuildContext context, int index,
                              //           int realIndex) =>
                              //       Container(
                              //     margin: EdgeInsets.symmetric(horizontal: 1),
                              //     child: Image.network(
                              //       '${vendor.sliderImages![index]}',
                              //       height: 265.h,
                              //       width: MediaQuery.of(context).size.width,
                              //       // foodVendorsProvider!.foodVendorModel.data![index].sliderImages![index],
                              //       fit: BoxFit.fill,
                              //     ),
                              //   ),
                              // ),
                            ),
                          ),
                          Positioned(
                            top: 40.h,
                            left: 10.w,
                            child: CustomCard(
                              height: 40.h,
                              width: 40.w,
                              cardRadius: 10,
                              border: Border.all(color: Colors.black12),
                              cardChild: Builder(builder: (context) {
                                return IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () => Navigator.of(context).pop(),
                                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                                );
                              }),
                            ),
                          ),
                          Positioned(
                            top: 216.h,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: CustomCard(
                                height: 95.h,
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
                                      horizontal: 20.w, vertical: 10.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: vendor.name ?? '',
                                            //  foodVendorsProvider!
                                            //     .foodVendorModel.data![0].name,
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
                                                text: vendor.location ?? '',
                                                // foodVendorsProvider!.foodVendorModel.data![0].location,
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
                                                text: vendor.phone ?? '',

                                                // foodVendorsProvider!.foodVendorModel.data![0].phone,
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
                                                text: vendor.email ?? '',
                                                // text: foodVendorsProvider!
                                                //     .foodVendorModel.data![0].email,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10.sp,
                                                fontColor: kLightGray,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () => Navigator.pushNamed(
                                            context, SendEmailScreen.id),
                                        child: CustomCard(
                                          height: 37.h,
                                          width: 75.w,
                                          cardRadius: 5.r,
                                          cardColor: kYellow,
                                          cardChild: Center(
                                            child: CustomText(
                                              text: "Contact",
                                              fontColor: Colors.white,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
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
                  ),
                  SliverToBoxAdapter(
                    key: UniqueKey(),
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
                            text: vendor.description ?? '',

                            // text: foodVendorsProvider!
                            //     .foodVendorModel.data![0].description,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            fontColor: Colors.black.withOpacity(0.6),
                          ),
                          SizedBox(height: 10.h),
                          vendor.menuList!.isEmpty
                              ? Container()
                              : CustomText(
                                  text: "Foods Menu",
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                          // SizedBox(height: 5.h),
                          /*
                          SizedBox(
                            height: 45.h,
                            width: 350.w,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: vendor.menuList!.length,
                              // foodVendorsProvider!.foodVendorModel.data![0].menuList!.length,
                              // itemCount: tabBarItems.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                MenuList menu = vendor.menuList![index];
                                // _selectedMenu = vendor.menuList!.first.menuName!;
                                print('_selectedMenu ff ${_selectedMenu}');

                                return Row(
                                  children: [
                                    SizedBox(width: 5.w),
                                    InkWell(
                                      onTap: () {
                                        _selectedIndex = index;
                                        _selectedMenu = menu.menuName!;
                                        setState(() {});
                                        print(
                                            '_selectedMenu  ${_selectedMenu}');
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
                                            offset: Offset(0, 0),
                                          )
                                        ],
                                        cardChild: Center(
                                          child: CustomText(
                                            text: '${menu.menuName ?? ''}',
                                            // text: foodVendorsProvider!
                                            //     .foodVendorModel
                                            //     .data![index]
                                            //     .menuList![index]
                                            //     .menuName,
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
                                );
                              },
                            ),
                          ),

                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // CustomText(
                                //   text: _selectedMenu.isNotEmpty
                                //       ? _selectedMenu
                                //       : '${vendor.menuList!.first.menuName}',
                                // text: foodVendorsProvider!
                                //     .foodVendorModel
                                //     .data![_selectedIndex]
                                //     .menuList![_selectedIndex]
                                //     .menuName,
                                // ),
                                // Expanded(
                                // Container(
                                //   // height: 222,
                                //   child: buildList2(context, vendor.name!,
                                //       vendor.foodVendorItems!),
                                // ),
                                // DefaultTabController(
                                //   length: 2,
                                //   child: Column(
                                //     children: [
                                //       TabBar(
                                //         onTap: (index) {
                                //           // Tab index when user select it, it start from zero
                                //         },
                                //         tabs: const [
                                //           Tab(
                                //             icon: Icon(Icons.card_travel),
                                //           ),
                                //           Tab(
                                //             icon: Icon(Icons.add_shopping_cart),
                                //           ),
                                //         ],
                                //       ),
                                //       SizedBox(
                                //         height: 120,
                                //         child: TabBarView(
                                //           children: const [
                                //             Center(
                                //               child: Text(
                                //                 "0",
                                //                 style: TextStyle(fontSize: 40),
                                //               ),
                                //             ),
                                //             Center(
                                //               child: Text(
                                //                 "1",
                                //                 style: TextStyle(fontSize: 40),
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),   */
                        ],
                      ),
                    ),
                  ),
                  // SliverAppBar(
                  //   pinned: true,
                  //   backgroundColor: Colors.white,
                  //   title: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: const <Widget>[
                  //       Icon(Icons.dashboard),
                  //       Icon(Icons.tv),
                  //       Icon(Icons.person),
                  //     ],
                  //   ),
                  // ),
                  SliverAppBar(
                    leadingWidth: 2.w,
                    leading: Container(),
                    pinned: true,
                    backgroundColor: Colors.white,
                    title: SizedBox(
                      height: 45.h,
                      width: 350.w,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: vendor.menuList!.length,
                        // foodVendorsProvider!.foodVendorModel.data![0].menuList!.length,
                        // itemCount: tabBarItems.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          MenuList menu = vendor.menuList![index];
                          // _selectedMenu = vendor.menuList!.first.menuName!;
                          if (kDebugMode) {
                            print('_selectedMenu ff $_selectedMenu');
                          }

                          return Row(
                            children: [
                              SizedBox(width: 6.w),
                              InkWell(
                                onTap: () {
                                  _selectedIndex = index;
                                  _selectedMenu = menu.menuName!;
                                  setState(() {});
                                  if (kDebugMode) {
                                    print('_selectedMenu  $_selectedMenu');
                                  }
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
                                      offset: Offset(0, 0),
                                    )
                                  ],
                                  cardChild: Center(
                                    child: CustomText(
                                      text: menu.menuName ?? '',
                                      // text: foodVendorsProvider!
                                      //     .foodVendorModel
                                      //     .data![index]
                                      //     .menuList![index]
                                      //     .menuName,
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
                          );
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    key: UniqueKey(),
                    child: Container(
                      // height: 222,
                      child: buildList2(
                          context, vendor.name!, vendor.foodVendorItems!),
                    ),
                  ),
                  // SliverAnimatedList(
                  //   itemBuilder: (_, index, ___) {
                  //     return ListTile(
                  //       title: Text(index.toString()),
                  //     );
                  //   },
                  //   initialItemCount: 100,
                  // )
                ],
              ),
            ),
          );
  }

  buildList(BuildContext context, String? vendorName,
      List<FoodVendorItems>? foodVendorItems) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        // itemCount: foodVendorsProvider!
        //     .foodVendorModel.data![0].foodVendorItems!.length,
        itemCount: foodVendorItems!.length,
        itemBuilder: (context, index) {
          // var image =
          //     "https://saffronhub.citizensadgrace.com/public/storage/food-items/vendor-slider-item-20221110-13182145233479.jpg";
          _selectedMenu = _selectedMenu.isNotEmpty
              ? _selectedMenu
              : foodVendorItems.first.foodMenu!;
          return foodVendorItems[index].foodMenu != _selectedMenu
              ? Container()
              : InkWell(
                  onTap: () {
                    //
                    showModalBottomSheet(
                      context: context,
                      builder: (builder) => CustomBottomSheet(
                        vendorName: vendorName,
                        item: foodVendorItems[index],
                      ),
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    );
                  },
                  child: Column(
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
                            SizedBox(
                              height: MediaQuery.of(context).size.height,
                              width: 118.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  bottomLeft: Radius.circular(10.r),
                                ),
                                child: Image.network(
                                  '${foodVendorItems[index].image}', // image!,
                                  height: MediaQuery.of(context).size.height,
                                  width: 118.w,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16.h, left: 20.w),
                              child: SizedBox(
                                width:
                                    MediaQuery.of(context).size.width - 180.w,
                                child: CustomText(
                                  text: '${foodVendorItems[index].name}',
                                  //  imageTitle,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 3.h),
                    ],
                  ),
                );
        },
      ),
    );
  }
  // Wrap(
  //     children: foodVendorItems!.map((e) {
  //   return Text('data');
  // }).toList()),
  // ListView.builder(
  //   // itemCount: foodVendorsProvider!
  //   //     .foodVendorModel.data![0].foodVendorItems!.length,
  //   itemCount: foodVendorItems!.length,
  //   itemBuilder: (context, index) {
  // var image =
  //     "https://saffronhub.citizensadgrace.com/public/storage/food-items/vendor-slider-item-20221110-13182145233479.jpg";

  buildList2(BuildContext context, String? vendorName,
      List<FoodVendorItems>? foodVendorItems) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Center(
        child: Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.vertical,
            children: foodVendorItems!.map(
              (item) {
                _selectedMenu = _selectedMenu.isNotEmpty
                    ? _selectedMenu
                    : foodVendorItems.first.foodMenu!;
                return item.foodMenu != _selectedMenu
                    ? Container()
                    : InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (builder) => CustomBottomSheet(
                              vendorName: vendorName,
                              item: item,
                            ),
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                          );
                        },
                        child: Column(
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
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: 118.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.r),
                                        bottomLeft: Radius.circular(10.r),
                                      ),
                                      child: Image.network(
                                        '${item.image}', // image!,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width: 118.w,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 16.h, left: 20.w),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          180.w,
                                      child: CustomText(
                                        text: '${item.name}',
                                        //  imageTitle,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4.h),
                          ],
                        ),
                      );
              },
            ).toList()),
      ),
    );
  }

  // getCurrentVendor() {
  //   if (_isInit) {
  //     foodVendorsProvider = Provider.of<FoodVendorsProvider>(context);
  //     // await foodVendorsProvider!.getFoodVendorData();
  //     vendorIndex = foodVendorsProvider!.currentVendor;
  //   }
  //   _isInit = false;
  // }
}
