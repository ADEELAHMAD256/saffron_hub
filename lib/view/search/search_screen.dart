import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:saffron_hub/models/vendors_model.dart';
import 'package:saffron_hub/provider/food_vendors_provider.dart';
import 'package:saffron_hub/services/search_services.dart';
import 'package:saffron_hub/components/custom_card/custom_card.dart';
import 'package:saffron_hub/components/custom_text/text.dart';
import 'package:saffron_hub/consts/const_colors.dart';
import 'package:saffron_hub/view/food_vendor/food_vendor_screen.dart';

class SearchScreen extends StatefulWidget {
  static const String id = "SearchScreen";
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? forSearch;
  Vendors? vendors;
  bool? isSearching = false;
  late FoodVendorsProvider foodVendorsProvider;

  // @override
  // initState() {
  //   foodVendorsProvider = Provider.of<FoodVendorsProvider>(context);
  //   super.initState();
  // }

  @override
  Future<void> didChangeDependencies() async {
    await getData();
    super.didChangeDependencies();
  }

  bool _isInit = true;

  Future<void> getData() async {
    if (_isInit) {
      foodVendorsProvider = Provider.of<FoodVendorsProvider>(context);
      // await foodVendorsProvider.getAllFoodVendors();
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 15.sp,
            color: Colors.black,
          ),
        ),
        title: CustomText(
          text: "Search",
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontColor: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  prefixIcon: Icon(
                    Icons.search_sharp,
                    color: kYellow,
                  ),
                  hintText: "Search by restaurant name or Menu item name",
                ),
                onSubmitted: (value) async {
                  isSearching = true;
                  print('value >> $value');
                  forSearch = value;
                  vendors = null;

                  setState(() {});

                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SpinKitSpinningLines(color: kYellow);
                      });
                  vendors = await SearchServices().searchFor(forSearch);
                  isSearching = false;
                  Navigator.pop(context);
                  setState(() {});
                },
              ),
            ),
            SizedBox(height: 20.h),
            vendors == null
                ? Container()
                : CustomText(
                    text: "${vendors!.data!.length} Vendors with “$forSearch” ",
                    // text: "2 Vendors with “Samosa” ",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
            vendors == null
                ? Container()
                : Flexible(
                    child: ListView.builder(
                      itemCount: vendors!.data!.length,
                      // vendorsItemList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            foodVendorsProvider.currentVendor = index;
                            foodVendorsProvider.searchedMode = true;
                            foodVendorsProvider.searchedVendor =
                                vendors!.data![index];
                            await Navigator.pushNamed(
                                context, FoodVendorScreen.id);
                            _isInit = true;
                            setState(() {});
                            await getData();
                            setState(() {});
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.h),
                              Container(
                                height: 182.h,
                                width: 335.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
                                // child: Image.asset(
                                child: Image.network(
                                  vendors!.data![index].sliderImages!.first,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              CustomText(
                                text: vendors!.data![index].name,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: 3.h),
                              Row(
                                children: [
                                  Icon(Icons.phone_in_talk_outlined,
                                      size: 12.sp),
                                  SizedBox(width: 10.w),
                                  CustomText(
                                    text: vendors!.data![index].phone,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                  )
                                ],
                              ),
                              SizedBox(height: 3.h),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined, size: 12.sp),
                                  SizedBox(width: 10.w),
                                  CustomText(
                                    text: vendors!.data![index].location,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              SizedBox(
                                height: 78.h,
                                child: ListView.builder(
                                  itemCount: vendors!
                                      .data![index].foodVendorItems!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, itemIndex) {
                                    FoodVendorItems item = vendors!.data![index]
                                        .foodVendorItems![itemIndex];
                                    print('item.image!, ${item.image!}');
                                    return Row(
                                      children: [
                                        SizedBox(width: 1.5.w),
                                        CustomCard(
                                          height: 75.h,
                                          width: 193.w,
                                          cardRadius: 5,
                                          cardColor: Colors.white,
                                          shadow: const [
                                            BoxShadow(
                                              color: Colors.black12,
                                              spreadRadius: 0.4,
                                              blurRadius: 1,
                                            ),
                                          ],
                                          cardChild: Center(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomCard(
                                                  height: 60.h,
                                                  width: 60.w,
                                                  cardRadius: 3,
                                                  // cardChild: Image.asset(
                                                  cardChild: Image.network(
                                                    item.image!,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                SizedBox(width: 10.w),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 6.h),
                                                  width: 100.w,
                                                  child: CustomText(
                                                    text: item.name,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                      ],
                                    );
                                  },
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
}
