

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saffron_hub/CustomContainer.dart';
import 'package:saffron_hub/controller/home_controller.dart';
import 'package:saffron_hub/models/getproductbystore.dart';

import '../../components/custom_text/text.dart';

class GetProductScreen extends StatefulWidget {
  const GetProductScreen({Key? key}) : super(key: key);

  @override
  State<GetProductScreen> createState() => _GetProductScreenState();
}

class _GetProductScreenState extends State<GetProductScreen> {
  // late ProductsList productsList;
  List<int> selectedItem = [];

  @override
  Future<void> didChangeDependencies() async {
    // _isInit = true;
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      widget: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Container(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Color(0xff677294),
                            size: 13,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                CustomText(
                  text: "My Doctor",
                  fontColor: Color(0xff333333),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  //letterSpacing: -0.3,
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<HomeController>(
                      init: HomeController(),
                      builder: (cont) {
                        return Container(
                          height: 600.h,
                          child: cont.searchDoctorbySpecialitylist.isEmpty
                              ? const Center(child: Text("No Data Found"))
                              : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                            cont.searchDoctorbySpecialitylist.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                                  ProductsList
                                  searchbyspecialitytDoctorModel =
                                  cont.searchDoctorbySpecialitylist[
                                  index];

                              return GestureDetector(
                                child: Card(
                                  elevation: 0.0,
                                  color: Colors.transparent,
                                  child: Column(
                                    children: [
                                      Container(
                                        // height: 200.h,
                                          width: double.infinity.w,
                                          padding:
                                          const EdgeInsets.all(18.0)
                                              .r,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(
                                                8.r),
                                            border: Border.all(
                                                width: 1,
                                                color: const Color(
                                                    0xffFFFFFF)),
                                            boxShadow: [
                                              const BoxShadow(
                                                offset: Offset(0, 0),
                                                blurRadius: 4.0,
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.2),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius
                                                            .circular(10),
                                                        topRight: Radius
                                                            .circular(10),
                                                        bottomLeft: Radius
                                                            .circular(10),
                                                        bottomRight:
                                                        Radius
                                                            .circular(
                                                            10)),
                                                    child: Image.network(
                                                      searchbyspecialitytDoctorModel
                                                          .productImage ??
                                                          "",
                                                      fit: BoxFit.cover,
                                                      width: 100.w,
                                                      height: 120.h,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(
                                                        left: 14.w),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        CustomText(
                                                          text:
                                                          searchbyspecialitytDoctorModel
                                                              .productName,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                          fontSize: 18.sp,
                                                          fontColor: Color(
                                                              0xff000000),
                                                        ),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        SizedBox(
                                                          width: 150.w,
                                                          child:
                                                          CustomText(
                                                            text: searchbyspecialitytDoctorModel
                                                                .productDescription,
                                                            fontWeight:
                                                            FontWeight
                                                                .w500,
                                                            fontSize:
                                                            18.sp,
                                                            fontColor: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),

                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  setState(() {});
                                },
                              );
                            },
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
