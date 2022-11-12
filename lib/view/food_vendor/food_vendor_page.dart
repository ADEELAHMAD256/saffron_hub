// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:provider/provider.dart';
// import 'package:saffron_hub/components/custom_card/custom_card.dart';
// import 'package:saffron_hub/components/custom_text/text.dart';
// import 'package:saffron_hub/consts/const_colors.dart';
// import 'package:saffron_hub/models/vendors_model.dart';
// import 'package:saffron_hub/provider/food_vendors_provider.dart';
// import 'package:saffron_hub/view/food_vendor/bottom_sheet/custom_bottom_sheet.dart';

// class CustomScrollViewScreen extends StatefulWidget {
//   static const String id = "CustomScrollViewScreen";
//   const CustomScrollViewScreen({Key? key}) : super(key: key);

//   @override
//   CustomScrollViewScreenState createState() => CustomScrollViewScreenState();
// }

// class CustomScrollViewScreenState extends State<CustomScrollViewScreen>
//     with TickerProviderStateMixin {
//   TabController? tabController;
//   late int _selectedIndex = 0;
//   late String _selectedMenu = '';
//   late FoodVendorsProvider foodVendorsProvider;
//   bool _isInit = true;
//   int? vendorIndex;
//   late Data vendor;
//   @override
//   void didChangeDependencies() async {
//     if (_isInit) {
//       foodVendorsProvider = Provider.of<FoodVendorsProvider>(context);
//       // await foodVendorsProvider!.getFoodVendorData();
//       vendorIndex = foodVendorsProvider.currentVendor;
//       vendor = foodVendorsProvider.foodVendors.data![vendorIndex!];
//     }
//     _isInit = false;
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     tabController = TabController(length: 2, vsync: this);
//     return _isInit
//         ? const Center(child: SpinKitSpinningLines(color: kYellow))
//         : Scaffold(
//             body: SafeArea(
//               child: CustomScrollView(
//                 slivers: [
//                   SliverToBoxAdapter(
//                     key: UniqueKey(),
//                     child: Container(
//                       // color: Colors.green,
//                       // height: 400,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           // Center(child: Text("Profile details")),
//                           SizedBox(
//                             height: 330.h,
//                             child: Stack(
//                               clipBehavior: Clip.none,
//                               alignment: Alignment.center,
//                               children: [
//                                 Positioned(
//                                   top: 0.0,
//                                   left: 0.0,
//                                   right: 0.0,
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.only(
//                                         // bottomLeft: Radius.circular(10),
//                                         // bottomRight: Radius.circular(10),
//                                         ),
//                                     child: CustomCard(
//                                       height: 260.h,
//                                       width: MediaQuery.of(context).size.width,
//                                       cardRadius: 0, //10
//                                       cardColor: kLightGray,
//                                       cardChild: ClipRRect(
//                                         // borderRadius: BorderRadius.circular(10),
//                                         child: Image.network(
//                                           '${vendor.sliderImages!.first}',
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: 216.h,
//                                   child: Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 20.w),
//                                     child: CustomCard(
//                                       height: 95.h,
//                                       width: 335.w,
//                                       cardRadius: 10,
//                                       cardColor: Colors.white,
//                                       shadow: [
//                                         BoxShadow(
//                                           color:
//                                               Colors.blueGrey.withOpacity(0.3),
//                                           blurRadius: 2,
//                                           spreadRadius: 1,
//                                         ),
//                                       ],
//                                       cardChild: Padding(
//                                         padding: EdgeInsets.symmetric(
//                                           horizontal: 20.w,
//                                           vertical: 12.h,
//                                         ),
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceEvenly,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             CustomText(
//                                               text: '${vendor.name ?? ''}',
//                                               //  foodVendorsProvider!
//                                               //     .foodVendorModel.data![0].name,
//                                               fontSize: 16.sp,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                             SizedBox(height: 3.h),
//                                             Row(
//                                               children: [
//                                                 Icon(
//                                                   Icons.location_on,
//                                                   size: 10.sp,
//                                                   color: kLightGray,
//                                                 ),
//                                                 SizedBox(width: 12.w),
//                                                 CustomText(
//                                                   text:
//                                                       '${vendor.location ?? ''}',
//                                                   // foodVendorsProvider!.foodVendorModel.data![0].location,
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize: 10.sp,
//                                                   fontColor: kLightGray,
//                                                 )
//                                               ],
//                                             ),
//                                             SizedBox(height: 3.h),
//                                             Row(
//                                               children: [
//                                                 Icon(
//                                                   Icons.phone_in_talk_outlined,
//                                                   size: 10.sp,
//                                                   color: kLightGray,
//                                                 ),
//                                                 SizedBox(width: 12.w),
//                                                 CustomText(
//                                                   text: '${vendor.phone ?? ''}',

//                                                   // foodVendorsProvider!.foodVendorModel.data![0].phone,
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize: 10.sp,
//                                                   fontColor: kLightGray,
//                                                 )
//                                               ],
//                                             ),
//                                             SizedBox(height: 3.h),
//                                             Row(
//                                               children: [
//                                                 Icon(
//                                                   Icons.email,
//                                                   size: 10.sp,
//                                                   color: kLightGray,
//                                                 ),
//                                                 SizedBox(width: 12.w),
//                                                 CustomText(
//                                                   text: '${vendor.email ?? ''}',
//                                                   // text: foodVendorsProvider!
//                                                   //     .foodVendorModel.data![0].email,
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize: 10.sp,
//                                                   fontColor: kLightGray,
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           ///
//                           Container(
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 20.w),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   CustomText(
//                                     text: "Introduction",
//                                     fontSize: 20.sp,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                   SizedBox(height: 10.h),
//                                   CustomText(
//                                     text: '${vendor.description ?? ''}',
//                                     // text: foodVendorsProvider!
//                                     //     .foodVendorModel.data![0].description,
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w300,
//                                     fontColor: Colors.black.withOpacity(0.6),
//                                   ),
//                                   SizedBox(height: 10.h),
//                                   CustomText(
//                                     text: "Foods Menu",
//                                     fontSize: 20.sp,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                   SizedBox(height: 5.h),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),

//                   //tabbar
//                   SliverPersistentHeader(
//                     pinned: true,
//                     floating: true,
//                     delegate: MyCustomHeader(
//                       expandedHeight: kToolbarHeight,
//                       tabs: TabBar(
//                         controller: tabController,
//                         onTap: (index) {
//                           print('index is $index');
//                           // _selectedIndex = index;
//                           // _selectedMenu = vendor.menuList![index].menuName!;
//                           // setState(() {});
//                           // print('_selectedMenu  ${_selectedMenu}');
//                         },
//                         tabs: vendor.menuList!.map((menu) {
//                           // _selectedIndex =
//                           //     int.parse(vendor.menuList!.first.menuId!);
//                           return Container(
//                             height: 40.h,
//                             // width: 75.w,
//                             child: Center(
//                               child: CustomText(
//                                 text: '${menu.menuName ?? ''}',
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                         // [
//                         //   Icon(
//                         //     Icons.ac_unit,
//                         //     size: 30,
//                         //     color: Colors.black,
//                         //   ),
//                         //   Icon(
//                         //     Icons.access_alarm,
//                         //     size: 30,
//                         //     color: Colors.black,
//                         //   ),
//                         // ],
//                       ),
//                     ),
//                   ),
//                   //children
//                   SliverFillRemaining(
//                     // hasScrollBody: false,
//                     child: TabBarView(
//                       controller: tabController,
//                       children: vendor.menuList!.map((menu) {
//                         return MediaQuery.removePadding(
//                           context: context,
//                           removeTop: true,
//                           child: Wrap(
//                             alignment: WrapAlignment.center,
//                             direction: Axis.vertical,
//                             children: vendor.foodVendorItems!.map(
//                               (item) {
//                                 // _selectedMenu = _selectedMenu.isNotEmpty
//                                 //     ? _selectedMenu
//                                 //     : vendor.foodVendorItems!.first.foodMenu!;
//                                 return item.foodMenu != menu.menuName
//                                     ? Container()
//                                     : InkWell(
//                                         onTap: () {
//                                           showModalBottomSheet(
//                                             context: context,
//                                             builder: (builder) =>
//                                                 CustomBottomSheet(
//                                               vendorName: vendor.name,
//                                               item: item,
//                                             ),
//                                             isScrollControlled: true,
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius: BorderRadius.only(
//                                                 topLeft: Radius.circular(10),
//                                                 topRight: Radius.circular(10),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                         child: Column(
//                                           children: [
//                                             SizedBox(height: 7.h),
//                                             CustomCard(
//                                               height: 118.h,
//                                               width: 335.w,
//                                               cardRadius: 10,
//                                               cardColor: Colors.white,
//                                               border: Border.all(
//                                                   color: Colors.black12),
//                                               cardChild: Row(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   SizedBox(
//                                                     height:
//                                                         MediaQuery.of(context)
//                                                             .size
//                                                             .height,
//                                                     width: 118.w,
//                                                     child: ClipRRect(
//                                                       borderRadius:
//                                                           BorderRadius.only(
//                                                         topLeft:
//                                                             Radius.circular(
//                                                                 10.r),
//                                                         bottomLeft:
//                                                             Radius.circular(
//                                                                 10.r),
//                                                       ),
//                                                       child: Image.network(
//                                                         '${item.image ?? ''}', // image!,
//                                                         height: MediaQuery.of(
//                                                                 context)
//                                                             .size
//                                                             .height,
//                                                         width: 118.w,
//                                                         fit: BoxFit.fill,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding: EdgeInsets.only(
//                                                         top: 16.h, left: 20.w),
//                                                     child: SizedBox(
//                                                       width:
//                                                           MediaQuery.of(context)
//                                                                   .size
//                                                                   .width -
//                                                               180.w,
//                                                       child: CustomText(
//                                                         text:
//                                                             '${item.name ?? ''}',
//                                                         //  imageTitle,
//                                                         fontSize: 14.sp,
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                       ),
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                             SizedBox(height: 3.h),
//                                           ],
//                                         ),
//                                       );
//                               },
//                             ).toList(),
//                           ),
//                         );
//                       }).toList(),
//                       // [
//                       //   Center(child: Text("I'm 1")),
//                       //   Center(child: Text("I'm 2"))
//                       // ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//   }
// }

// /// persistent header
// class MyCustomHeader extends SliverPersistentHeaderDelegate {
//   MyCustomHeader({
//     @required this.expandedHeight,
//     this.tabs,
//     this.context,
//   });

//   final Widget? tabs;
//   final double? expandedHeight;
//   final BuildContext? context;

//   @override
//   double get maxExtent => expandedHeight!;

//   @override
//   double get minExtent => kToolbarHeight;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       child: tabs,
//     );
//   }
// }

// /*
// import 'package:flutter/material.dart';

// class CustomScrollViewScreen extends StatefulWidget {
//   static const String id = "CustomScrollViewScreen";
//   const CustomScrollViewScreen({Key? key}) : super(key: key);

//   @override
//   CustomScrollViewScreenState createState() => CustomScrollViewScreenState();
// }

// class CustomScrollViewScreenState extends State<CustomScrollViewScreen>
//     with TickerProviderStateMixin {
//   TabController? tabController;
//   @override
//   Widget build(BuildContext context) {
//     tabController = TabController(length: 2, vsync: this);
//     return Scaffold(
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             // SliverAppBar(
//             //   floating: true,
//             //   title: Text("AppBar"),
//             // ),
//             // //profile widget

//             SliverToBoxAdapter(
//               key: UniqueKey(),
//               child: Container(
//                 color: Colors.green,
//                 height: 400,
//                 child: Center(child: Text("Profile details")),
//               ),
//             ),

//             //tabbar
//             SliverPersistentHeader(
//                 pinned: true,
//                 floating: true,
//                 delegate: MyCustomHeader(
//                     expandedHeight: kToolbarHeight,
//                     tabs: TabBar(
//                       controller: tabController,
//                       tabs: [
//                         Icon(
//                           Icons.ac_unit,
//                           size: 30,
//                           color: Colors.black,
//                         ),
//                         Icon(
//                           Icons.access_alarm,
//                           size: 30,
//                           color: Colors.black,
//                         ),
//                       ],
//                     ))),
//             //children
//             SliverFillRemaining(
//               child: TabBarView(
//                 controller: tabController,
//                 children: [
//                   Center(child: Text("I'm 1")),
//                   Center(child: Text("I'm 2"))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// persistent header
// class MyCustomHeader extends SliverPersistentHeaderDelegate {
//   MyCustomHeader({
//     @required this.expandedHeight,
//     this.tabs,
//     this.context,
//   });

//   final Widget? tabs;
//   final double? expandedHeight;
//   final BuildContext? context;

//   @override
//   double get maxExtent => expandedHeight!;

//   @override
//   double get minExtent => kToolbarHeight;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       child: tabs,
//     );
//   }
// }

// */
