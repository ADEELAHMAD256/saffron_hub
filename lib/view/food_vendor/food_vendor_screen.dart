import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:saffron_hub/components/custom_card/custom_card.dart';
import 'package:saffron_hub/components/custom_text/text.dart';
import 'package:saffron_hub/consts/const_colors.dart';
import 'package:saffron_hub/models/vendors_model.dart';
import 'package:saffron_hub/provider/food_vendors_provider.dart';
import 'package:saffron_hub/view/food_vendor/bottom_sheet/custom_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../db_helper/db_helper.dart';
import '../../models/cart_model.dart';
import '../../provider/cart_provider.dart';
import '../cart/cart_screen.dart';
import '../detailsForm.dart';
import '../send_email_screen/email_screen.dart';

class FoodVendorScreen extends StatefulWidget {
  static const String id = "FoodVendorScreen";
  const FoodVendorScreen({Key? key}) : super(key: key);

  @override
  State<FoodVendorScreen> createState() => _FoodVendorScreenState();
}

class _FoodVendorScreenState extends State<FoodVendorScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  DBHelper dbHelper = DBHelper();
  late CartProvider cartProvider;
  late int _selectedIndex = 0;
  late String _selectedMenu = '';
  late FoodVendorsProvider foodVendorsProvider;
  bool _isInit = true;
  int? vendorIndex;
  late Data vendor;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      foodVendorsProvider = Provider.of<FoodVendorsProvider>(context);

      // await foodVendorsProvider!.getFoodVendorData();
      vendorIndex = foodVendorsProvider.currentVendor;
      if (foodVendorsProvider.searchedMode) {
        vendor = foodVendorsProvider.searchedVendor;
      } else {
        vendor = foodVendorsProvider.foodVendors![vendorIndex!];
        // vendor = foodVendorsProvider.vendors.data![vendorIndex!];
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // cartProvider = Provider.of<CartProvider>(context);
    return _isInit
        ? const Center(child: SpinKitSpinningLines(color: kYellow))
        : Scaffold(
            key: _scaffoldKey,
            body: Center(
              // child: Column(
              //   children: [
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    key: UniqueKey(),
                    child: SizedBox(
                      height: 370.h,
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
                            top: 205.h,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: CustomCard(
                                //height: 115.h,
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
                                      horizontal: 10.w, vertical: 10.h),
                                  child: Column(
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
                                      SizedBox(height: 8.h),
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
                                      SizedBox(height: 8.h),
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
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
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
                                          // SizedBox(width: 120.w),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      InkWell(
                                        onTap: (){
                                          Get.to(DetailsForm());
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.home_repair_service,
                                                  size: 10.sp,
                                                  color: kLightGray,
                                                ),
                                                SizedBox(width: 12.w),
                                                CustomText(
                                                  text:'Reserve',
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
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Get.to(DetailsForm());
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.delivery_dining,
                                                  size: 10.sp,
                                                  color: kLightGray,
                                                ),
                                                SizedBox(width: 12.w),
                                                CustomText(
                                                  text:'Free delivery',
                                                  // text: foodVendorsProvider!
                                                  //     .foodVendorModel.data![0].email,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10.sp,
                                                  fontColor: kLightGray,
                                                ),
                                              ],
                                            ),
                                            // SizedBox(width: 120.w),
                                            InkWell(
                                              onTap: () {
                                                launch(
                                                    'https://saffronhub.citizensadgrace.com/contact-us/${vendor.email}');
                                              },
                                              child: CustomCard(
                                                height: 30.h,
                                                width: 50.w,
                                                cardRadius: 5.r,
                                                cardColor: kYellow,
                                                cardChild: Center(
                                                  child: CustomText(
                                                    text: "Contact",
                                                    fontColor: Colors.white,
                                                    fontSize: 10.sp,
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
                        ],
                      ),
                    ),
                  ),
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: SliverAppBar(
                      leadingWidth: 0.5.w,
                      // expandedHeight: 10.h,
                      // collapsedHeight: 50.h,
                      // toolbarHeight: 50,
                      leading: Container(),
                      pinned: true,
                      flexibleSpace: Container(
                        padding: EdgeInsets.all(10.r),
                        height: 10,
                        width: double.infinity,
                      ),
                      backgroundColor: Colors.white,
                      stretchTriggerOffset: 60,
                      floating: true,
                      title: SizedBox(
                        height: 45.h,
                        width: 350.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
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
                                          // setState(() {});
                                          if (kDebugMode) {
                                            print(
                                                '_selectedMenu  $_selectedMenu');
                                          }
                                        },
                                        child: CustomCard(
                                          height: 37.h,
                                          //width: 75.w,
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
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CustomText(
                                                text: menu.menuName ?? '',
                                                fontSize: 12.sp,
                                                fontColor:
                                                    _selectedIndex == index
                                                        ? Colors.white
                                                        : Colors.black,
                                                fontWeight: FontWeight.w400,
                                              ),
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
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, AddToCartScreen.id),
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Positioned(
                                    left: 20.w,
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.blueGrey,
                                      child: Consumer<CartProvider>(
                                        builder: (BuildContext context, value,
                                                Widget? child) =>
                                            CustomText(
                                          text: value.counter.toString(),
                                          fontColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
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
                ],
              ),
            ),
          );
  }

  // buildList(BuildContext context, String? vendorName,
  //     List<FoodVendorItems>? foodVendorItems) {
  //   return MediaQuery.removePadding(
  //     context: context,
  //     removeTop: true,
  //     child: ListView.builder(
  //       // itemCount: foodVendorsProvider!
  //       //     .foodVendorModel.data![0].foodVendorItems!.length,
  //       itemCount: foodVendorItems!.length,
  //       itemBuilder: (context, index) {
  //         // var image =
  //         //     "https://saffronhub.citizensadgrace.com/public/storage/food-items/vendor-slider-item-20221110-13182145233479.jpg";
  //         _selectedMenu = _selectedMenu.isNotEmpty
  //             ? _selectedMenu
  //             : foodVendorItems.first.foodMenu!;
  //         return foodVendorItems[index].foodMenu != _selectedMenu
  //             ? Container()
  //             : InkWell(
  //                 onTap: () {
  //                   //
  //                   showModalBottomSheet(
  //                     context: context,
  //                     builder: (builder) => CustomBottomSheet(
  //                       vendorName: vendorName,
  //                       item: foodVendorItems[index],
  //                     ),
  //                     isScrollControlled: true,
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.only(
  //                         topLeft: Radius.circular(10),
  //                         topRight: Radius.circular(10),
  //                       ),
  //                     ),
  //                   );
  //                 },
  //                 child: Column(
  //                   children: [
  //                     SizedBox(height: 7.h),
  //                     CustomCard(
  //                       height: 118.h,
  //                       width: 335.w,
  //                       cardRadius: 10,
  //                       cardColor: Colors.white,
  //                       border: Border.all(color: Colors.black12),
  //                       cardChild: Row(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           SizedBox(
  //                             height: MediaQuery.of(context).size.height,
  //                             width: 118.w,
  //                             child: ClipRRect(
  //                               borderRadius: BorderRadius.only(
  //                                 topLeft: Radius.circular(10.r),
  //                                 bottomLeft: Radius.circular(10.r),
  //                               ),
  //                               child: Image.network(
  //                                 '${foodVendorItems[index].image}', // image!,
  //                                 height: MediaQuery.of(context).size.height,
  //                                 width: 118.w,
  //                                 fit: BoxFit.fill,
  //                               ),
  //                             ),
  //                           ),
  //                           Padding(
  //                             padding: EdgeInsets.only(top: 16.h, left: 20.w),
  //                             child: SizedBox(
  //                               width:
  //                                   MediaQuery.of(context).size.width - 180.w,
  //                               child: CustomText(
  //                                 text: '${foodVendorItems[index].name}',
  //                                 //  imageTitle,
  //                                 fontSize: 14.sp,
  //                                 fontWeight: FontWeight.w400,
  //                               ),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                     SizedBox(height: 3.h),
  //                   ],
  //                 ),
  //               );
  //       },
  //     ),
  //   );
  // }

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
                          //
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
                                      child:CachedNetworkImage(
                                        imageUrl:item.image ?? '',
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                              "assets/images/notImage.png",
                                              height:
                                              MediaQuery.of(context).size.height,
                                              width: 118.w,
                                              fit: BoxFit.fill,
                                            ),
                                        height:
                                        MediaQuery.of(context).size.height,
                                        width: 118.w,
                                        fit: BoxFit.fill,
                                      )


                                      // Image.network(
                                      //   item.image ?? '', // image!,
                                      //   height:
                                      //       MediaQuery.of(context).size.height,
                                      //   width: 118.w,
                                      //   fit: BoxFit.fill,
                                      // ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 16.h, left: 20.w),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          180.w,
                                      child: Column(
                                        children: [
                                          CustomText(
                                            text: item.name ?? '',
                                            //  imageTitle,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(height: 40.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  dbHelper
                                                      .insert(
                                                    Cart(
                                                      productId: item.itemId!,
                                                      productName: item.name!,
                                                      productImage: item.image!,
                                                      quantity: 1,
                                                    ),
                                                  )
                                                      .then((v) {
                                                    print(
                                                        "add to cart success");
                                                    cartProvider.addItems();
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "${item.name ?? ''}has been added to your cart"),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ));
                                                },
                                                child: CustomCard(
                                                  height: 30.h,
                                                  width: 90.w,
                                                  cardRadius: 5.r,
                                                  cardColor: kYellow,
                                                  cardChild: Center(
                                                    child: CustomText(
                                                      text: "Add to cart",
                                                      fontColor: Colors.white,
                                                      fontSize: 10.sp,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
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

/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:saffron_hub/components/custom_card/custom_card.dart';
import 'package:saffron_hub/components/custom_text/text.dart';
import 'package:saffron_hub/consts/const_colors.dart';
import 'package:saffron_hub/models/vendors_model.dart';
import 'package:saffron_hub/provider/food_vendors_provider.dart';
import 'package:saffron_hub/view/food_vendor/bottom_sheet/custom_bottom_sheet.dart';

class FoodVendorScreen extends StatefulWidget {
  static const String id = "FoodVendorScreen";
  const FoodVendorScreen({Key? key}) : super(key: key);

  @override
  State<FoodVendorScreen> createState() => _FoodVendorScreenState();
}

class _FoodVendorScreenState extends State<FoodVendorScreen> {
  late int _selectedIndex = 0;
  late String _selectedMenu = '';
  late FoodVendorsProvider foodVendorsProvider;
  bool _isInit = true;
  int? vendorIndex;
  late Data vendor;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      foodVendorsProvider = Provider.of<FoodVendorsProvider>(context);
      // await foodVendorsProvider!.getFoodVendorData();
      vendorIndex = foodVendorsProvider.currentVendor;
      vendor = foodVendorsProvider.foodVendors.data![vendorIndex!];
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _isInit
        ? const Center(child: SpinKitSpinningLines(color: kYellow))
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
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
                                  '${vendor.sliderImages!.first}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),

                            // child: CarouselSlider.builder(
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
                                      text: '${vendor.name ?? ''}',
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
                                          text: '${vendor.location ?? ''}',
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
                                          text: '${vendor.phone ?? ''}',
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
                                          text: '${vendor.email ?? ''}',
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
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Flexible(
                  Container(
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
                            text: '${vendor.description ?? ''}',
                            // text: foodVendorsProvider!
                            //     .foodVendorModel.data![0].description,
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
                              itemCount: vendor.menuList!.length,
                              // foodVendorsProvider!.foodVendorModel.data![0].menuList!.length,
                              // itemCount: tabBarItems.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                MenuList menu = vendor.menuList![index];
                                // _selectedMenu = vendor.menuList!.first.menuName!;
                                // print('_selectedMenu ff ${_selectedMenu}');
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
                                            // text: foodVendorsProvider!.foodVendorModel.data![index].menuList![index].menuName,
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
                          // Expanded(
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // CustomText(
                                //   text: _selectedMenu.isNotEmpty
                                //       ? _selectedMenu
                                //       : '${vendor.menuList!.first.menuName ?? ''}',
                                //   // text: foodVendorsProvider!.foodVendorModel.data![_selectedIndex].menuList![_selectedIndex].menuName,
                                // ),
                                // Expanded(
                                Container(
                                  child: buildList2(context, vendor.name!,
                                      vendor.foodVendorItems!),
                                ),
                                // _selectedIndex == 0?
                                // Expanded(
                                //   child: FoodVendorList(
                                //     foodVendorItems: vendor.foodVendorItems,
                                //     image:
                                //         '${vendor.foodVendorItems!.first.image}',
                                //     // image: foodVendorsProvider!.foodVendorModel.data![0].foodVendorItems![0].image,
                                //     imageTitle:
                                //         '${vendor.foodVendorItems!.first.name}',
                                //     // imageTitle: foodVendorsProvider.foodVendorModel.data![0].foodVendorItems![0].name,
                                //   ),
                                // )
                                // : _selectedIndex == 1
                                // ? Expanded(child: BiryaniList())
                                // : _selectedIndex == 2
                                // ? Expanded(child: MealsList())
                                // : Expanded(child: ChickenList()),
                              ],
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

  buildList2(BuildContext context, String? vendorName,
      List<FoodVendorItems>? foodVendorItems) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Wrap(
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
                        //
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
                                      '${item.image ?? ''}', // image!,
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
                                      text: '${item.name ?? ''}',
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
          ).toList()),
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


*/
