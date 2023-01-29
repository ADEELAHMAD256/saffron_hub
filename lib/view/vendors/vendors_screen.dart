import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:saffron_hub/consts/const_colors.dart';
import 'package:saffron_hub/models/vendors_model.dart';
import 'package:saffron_hub/provider/food_vendors_provider.dart';
import 'package:saffron_hub/view/food_vendor/food_vendor_page.dart';
import 'package:saffron_hub/view/food_vendor/food_vendor_page_scroll.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/custom_text/text.dart';
import '../food_vendor/food_vendor_detail.dart';
import '../food_vendor/food_vendor_screen.dart';

class VendorsScreen extends StatefulWidget {
  static const String id = "VendorsScreen";

  // final String? image;
  // final String? name;
  // final String? phoneNo;
  // final String? location;
  const VendorsScreen({
    Key? key,
    // @required this.image,
    // @required this.name,
    // @required this.phoneNo,
    // @required this.location,
  }) : super(key: key);

  @override
  State<VendorsScreen> createState() => _VendorsScreenState();
}

class _VendorsScreenState extends State<VendorsScreen> {
  bool _isInit = true;
  late FoodVendorsProvider foodVendorsProvider;

  bool? isSearchMode = false;
  String? forSearch = '';

  final scrollController = ScrollController();
  // List<Data>? foodVendors;
  bool? noMore = false;
  // @override
  // Future<void> didChangeDependencies() async {
  //   await getData();
  //   super.didChangeDependencies();
  // }
  List<Data>? foodVendors;
  Future<void> getData() async {
    if (_isInit) {
      foodVendorsProvider =
          Provider.of<FoodVendorsProvider>(context, listen: false);
      await foodVendorsProvider.getAllFoodVendors();
      foodVendorsProvider.foodVendors = [];
      for (var element in foodVendorsProvider.vendors.data!) {
        //
        foodVendorsProvider.foodVendors!.add(element);
      }
    }
    _isInit = false;
    setState(() {});
  }

  @override
  initState() {
    getData();
    scrollController.addListener(() {
      //
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        //
        fetchMoreData();
      }
      // if (scrollController.position.minScrollExtent ==
      //     scrollController.offset) {
      //   //
      //   fetchPreviousData();
      // }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isInit
        ? const Center(
            child:
                //  CustomText(
                //   text: "Loading...",
                //   fontSize: 34,
                //   fontWeight: FontWeight.w600,
                //   fontColor: kYellow,
                // ),
                SpinKitSpinningLines(color: kYellow),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () {
                  foodVendorsProvider.currentPage=1;
                  Navigator.pop(context);},
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 15.sp,
                  color: Colors.black,
                ),
              ),
              title: CustomText(
                text: "Vendors",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontColor: Colors.black,
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  CustomCard(
                    height: 45.h,
                    width: 335.w,
                    cardRadius: 10,
                    border: Border.all(color: Colors.black12),
                    cardColor: Colors.transparent,
                    cardChild: TextField(
                      cursorColor: kGray,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        prefixIcon: Icon(
                          Icons.search_sharp,
                          color: kYellow,
                        ),
                      ),
                      onChanged: (value) {
                        print('value >> $value');
                        forSearch = value;
                        if (value.isEmpty) {
                          isSearchMode = false;
                        } else {
                          isSearchMode = true;
                        }
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: foodVendorsProvider.foodVendors!.length + 1,
                      // FoodVendorsProvider().foodVendorModel.length,
                      itemBuilder: (context, index) {
                        if (index >= foodVendorsProvider.foodVendors!.length) {
                          return Center(
                              child: noMore!
                                  ? CustomText(
                                      text: 'No More Item',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                          width: 20.w,
                                          height: 20.h,
                                          child: CircularProgressIndicator()),
                                    ));
                        }
                        Data vendor = foodVendorsProvider.foodVendors![index];
                        return !vendor.name!
                                .toLowerCase()
                                .contains('${forSearch!.toLowerCase()}')
                            //  &&
                            // !isSearchMode!
                            ? Container()
                            : InkWell(
                                onTap: () async {
                                  foodVendorsProvider.currentVendor = index;
                                  await Navigator.pushNamed(
                                      context, FoodVendorScreen.id);
                                  // Popo.id); CustomScrollViewScreen.id);
                                  // _isInit = true;
                                  // setState(() {});
                                  // await getData();
                                  // setState(() {});
                                },
                                child: Column(
                                  children: [
                                    SizedBox(height: 20.h),
                                    CustomCard(
                                      height: 280.h,
                                      width: 335.w,
                                      cardRadius: 20,
                                      cardColor: Colors.white,
                                      cardChild: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 180.h,
                                            width: 335.w,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  '${vendor.sliderImages!.first}',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          // Image.network(
                                          //   '${vendor.sliderImages!.first}',
                                          //   fit: BoxFit.cover,
                                          //   height: 180.h,
                                          //   width: 335.w,
                                          // ),
                                          Flexible(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 0.5.r,
                                                    spreadRadius: 1.5.r,
                                                    offset: Offset(0, 0),
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.w),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 10.h),
                                                    CustomText(
                                                      text: '${vendor.name}',
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .phone_in_talk_outlined,
                                                          size: 12.sp,
                                                        ),
                                                        SizedBox(width: 10.w),
                                                        CustomText(
                                                          text:
                                                              '${vendor.phone}',
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .location_on_outlined,
                                                          size: 12.sp,
                                                        ),
                                                        SizedBox(width: 10.w),
                                                        CustomText(
                                                          text:
                                                              '${vendor.location}',
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 7.h),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  fetchMoreData() async {
    noMore = false;
    setState(() {});
    if (foodVendorsProvider.currentPage! <
        foodVendorsProvider.vendors.lastPage!) {
      foodVendorsProvider.currentPage = foodVendorsProvider.currentPage! + 1;
    } else {
      noMore = true;
      setState(() {});
      return;
    }
    await foodVendorsProvider.getAllFoodVendors();
    for (var element in foodVendorsProvider.vendors.data!) {
      foodVendorsProvider.foodVendors!.add(element);
    }
    setState(() {});

    // scrollController.jumpTo(1);
    // setState(() {});
  }

  fetchPreviousData() async {
    noMore = false;
    setState(() {});
    if (foodVendorsProvider.currentPage! > 1) {
      foodVendorsProvider.currentPage = foodVendorsProvider.currentPage! + 1;
    } else {
      //
      return;
    }
    await foodVendorsProvider.getAllFoodVendors();
    // foodVendors = foodVendorsProvider.vendors.data!;
    setState(() {});

    // scrollController.jumpTo(1);
    // setState(() {});
  }
}
