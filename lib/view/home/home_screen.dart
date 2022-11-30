import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:saffron_hub/consts/const_colors.dart';
import 'package:saffron_hub/models/food_vendor_model.dart';
import 'package:saffron_hub/provider/home_provider.dart';
import 'package:saffron_hub/view/food_vendor/food_vendor_detail.dart';
import 'package:saffron_hub/view/food_vendor/food_vendor_screen.dart';
import 'package:saffron_hub/view/search/search_screen.dart';
import 'package:saffron_hub/view/setting/setting_screen.dart';
import 'package:saffron_hub/view/vendors/vendors_screen.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/custom_text/text.dart';
import 'drawer/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  final double itemHeight = 226.h;
  final double itemWidth = 160.w;
  late HomeProvider homeProvider;
  bool _isInit = true;
  // int _current = 0;

  @override
  Future<void> didChangeDependencies() async {
    // _isInit = true;
    await getData();
    super.didChangeDependencies();
  }

  Future<void> getData() async {
    print('111');
    if (_isInit) {
      print('444');
      homeProvider = Provider.of<HomeProvider>(context, listen: false);
      await homeProvider.getBanners();
      await homeProvider.getRlm();
    }
    _isInit = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _isInit
        ? const Center(
            child:
                //
                //  CustomText(
                //   text: "Loading...",
                //   fontSize: 34,
                //   fontWeight: FontWeight.w600,
                //   fontColor: kYellow,
                // ),
                SpinKitSpinningLines(color: kYellow),
          )
        : Scaffold(
            key: _scaffoldState,
            drawer: Drawer(
              width: 250.w,
              child: Column(
                children: [
                  Container(
                    height: 206.h,
                    width: MediaQuery.of(context).size.width,
                    color: kYellow.withOpacity(0.56),
                    child: Center(
                      child: Image.asset(
                        "assets/images/saffron-hub-logo.png",
                        height: 88.h,
                        width: 167.w,
                      ),
                    ),
                  ),
                  createDrawerBodyItem(
                    icon: Icons.home,
                    iconColor: kYellow,
                    text: "Home",
                    fontColor: kYellow,
                    onTap: () {},
                  ),
                  createDrawerBodyItem(
                    icon: Icons.settings,
                    iconColor: Colors.black,
                    text: "Settings",
                    fontColor: Colors.black,
                    onTap: () =>
                        Navigator.pushNamed(context, AccountSettingScreen.id),
                  ),
                  createDrawerBodyItem(
                    icon: Icons.share,
                    iconColor: Colors.black,
                    text: "Share App",
                    fontColor: Colors.black,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomCard(
                              height: 40.h,
                              width: 40.w,
                              cardRadius: 10,
                              border: Border.all(color: Colors.black12),
                              cardChild: Builder(builder: (context) {
                                return IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () =>
                                      Scaffold.of(context).openDrawer(),
                                  icon: Icon(Icons.format_list_bulleted_sharp),
                                );
                              }),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  constraints: BoxConstraints(),
                                  padding: EdgeInsets.zero,
                                  onPressed: () => Navigator.pushNamed(
                                      context, SearchScreen.id),
                                  icon: Icon(
                                    Icons.search,
                                    color: kYellow,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                // IconButton(
                                //   padding: EdgeInsets.zero,
                                //   constraints: BoxConstraints(),
                                //   onPressed: () {},
                                //   icon: Icon(
                                //     Icons.notifications_none_outlined,
                                //     color: kYellow,
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Welcome To",
                              fontSize: 34.sp,
                              fontWeight: FontWeight.w600,
                              fontColor: kYellow,
                            ),
                            Image.asset(
                              "assets/images/saffron-hub-logo.png",
                              height: 68.w,
                              width: 110.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  ///=================================================================== Slider,

                  // CarouselSlider(
                  //   options: CarouselOptions(
                  //       disableCenter: false,
                  //       aspectRatio: 12 / 8,
                  //       initialPage: 0,
                  //       viewportFraction: 0.8,
                  //       enlargeCenterPage: true,
                  //       autoPlay: true,
                  //       reverse: false,
                  //       height: 150.h,
                  //       enableInfiniteScroll: true,
                  //       autoPlayInterval: const Duration(seconds: 3),
                  //       autoPlayAnimationDuration:
                  //           const Duration(milliseconds: 2200),
                  //       pauseAutoPlayOnTouch: true,
                  //       scrollDirection: Axis.horizontal,
                  //       pageSnapping: true,
                  //       onPageChanged: (index, val) {
                  //         // _current = index;
                  //         // setState(() {
                  //         // print('current index$_current $index');
                  //         // });
                  //       }),
                  //   items: [
                  //     for (int i = 0;
                  //         i < homeProvider.bannersModel.banners!.length;
                  //         i++)
                  CustomCard(
                    height: 169.h,
                    width: 335.w,
                    cardRadius: 10,
                    cardColor: kLightGray,
                    cardChild: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        homeProvider.bannersModel.banners![0].image ?? '',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  //   ],
                  // ),

                  ///
                  SizedBox(height: 30.h),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "You Might Like",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              InkWell(
                                onTap: () async {
                                  // var image =
                                  //     "https://saffronhub.citizensadgrace.com/public/storage/food-items/vendor-slider-image-20221107-05404552569777.jpg";
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VendorsScreen(
                                          // image: image,
                                          // // homeProvider.restaurantsListModel![0].vendorProfilePic,
                                          // name: 'Rices',
                                          // //  homeProvider.restaurantsListModel![0].name,
                                          // phoneNo: '9234534567',
                                          // // homeProvider.restaurantsListModel![0].phone,
                                          // location: 'Faisalabad',
                                          // homeProvider.restaurantsListModel![0].location
                                          ),
                                    ),
                                  );
                                  _isInit = true;
                                  setState(() {});
                                  await getData();
                                  setState(() {});
                                },
                                child: CustomText(
                                  text: "View All",
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  fontColor: kYellow,
                                ),
                              ),
                            ],
                          ),

                          ///============================================================================ Restaurants List

                          SizedBox(height: 30.h),
                          Flexible(
                            child: SingleChildScrollView(
                              child: GridView.builder(
                                // primary: false,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount:
                                    homeProvider.restaurantsListModel!.length,
                                // itemCount: homeProvider.restaurantsListModel![0]
                                //     .foodVendorItems!.length,
                                // itemCount: homeProvider
                                //     .restaurantsListModel.menuList!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 5,
                                  childAspectRatio: itemWidth / itemHeight,
                                  crossAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () async {
                                      homeProvider.currentVendor = index;
                                      print(
                                          'currentVendor>>${homeProvider.currentVendor}<<');
                                      await Navigator.pushNamed(
                                          context, FoodVendorDetailScreen.id);
                                      _isInit = true;
                                      setState(() {});
                                      await getData();
                                      setState(() {});
                                    },
                                    child: CustomCard(
                                      cardRadius: 16.r,
                                      border: Border.all(
                                        color: Colors.black12,
                                      ),
                                      cardColor: Colors.white,
                                      cardChild: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16.r),
                                              topRight: Radius.circular(16.r),
                                            ),
                                            child: Image.network(
                                              height: 140.h,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              '${homeProvider.restaurantsListModel![index].vendorProfilePic}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          /* Image.asset(
                                          homeItemList[index].itemImage,
                                          fit: BoxFit.fitWidth,
                                        ),*/
                                          SizedBox(height: 5.h),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                  text: homeProvider
                                                          .restaurantsListModel![
                                                              index]
                                                          .name ??
                                                      '',
                                                  fontSize: 14.sp,
                                                ),
                                                SizedBox(height: 3.h),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .phone_in_talk_outlined,
                                                      size: 12.sp,
                                                    ),
                                                    SizedBox(width: 10.w),
                                                    CustomText(
                                                      text: homeProvider
                                                              .restaurantsListModel![
                                                                  index]
                                                              .phone ??
                                                          '',
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 3.h),
                                                Row(
                                                  children: [
                                                    Icon(
                                                        Icons
                                                            .location_on_outlined,
                                                        size: 12.sp),
                                                    SizedBox(width: 8.w),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3.3,
                                                      child: CustomText(
                                                        text: homeProvider
                                                                .restaurantsListModel![
                                                                    index]
                                                                .location ??
                                                            '',
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
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
// CustomCard(
//   height: 196.h,
//   width: 335.w,
//   cardRadius: 10,
//   cardColor: kGray,
//   cardChild: Image.network(src),
// ),
