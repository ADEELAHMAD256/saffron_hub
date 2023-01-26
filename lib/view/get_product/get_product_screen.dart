import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:provider/provider.dart';
import 'package:saffron_hub/api/api_client.dart';
import 'package:saffron_hub/components/custom_card/custom_card.dart';
import 'package:saffron_hub/components/custom_text/text.dart';
import 'package:saffron_hub/consts/base_url.dart';
import 'package:saffron_hub/consts/const_colors.dart';
import 'package:saffron_hub/controller/auth_controller.dart';
import 'package:saffron_hub/controller/home_controller.dart';
import 'package:saffron_hub/models/getproductbystore.dart';
import 'package:saffron_hub/provider/get_product.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../CustomContainer.dart';
import '../../models/get_product_model.dart';
import '../../models/get_prroduct_cart_model.dart';
import '../../provider/get_product_cart_provider.dart';
import '../../db_helper/data_base.dart';
import '../../provider/sign_up_controller.dart';
import '../cart/get_product_cart_screen.dart';
import '../sign_in/sign_in_screen.dart';

class GetProductScreen extends StatefulWidget {
  GetProductScreen({Key? key}) : super(key: key);
  final SignUpController signUpController = SignUpController();
  @override
  State<GetProductScreen> createState() => _GetProductScreenState();
}

class _GetProductScreenState extends State<GetProductScreen> {
  // late ProductsList productsList;
  DataBaseHelper dataBaseHelper = DataBaseHelper();

  late GetProductCartProvider getProductCartProvider;
  // bool isAuth = false;
  // late Future<bool> loginCheckFuture;
  var auth = Get.find<AuthController>();

  @override
  void initState() {
    print(auth.user?.accessToken);
    // checkout();

    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    getProductCartProvider = Provider.of<GetProductCartProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GetProductCartScreen())),
            child: Icon(Icons.shopping_cart_outlined),
          ),
          SizedBox(width: 20.w)
        ],
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
                text: "Saffron Hub Products",
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
                              itemBuilder: (BuildContext context, int index) {
                                // ProductsList
                                // searchbyspecialitytDoctorModel =
                                // cont.searchDoctorbySpecialitylist[
                                // index];
                                final doctor =
                                    cont.searchDoctorbySpecialitylist[index];
                                return GestureDetector(
                                  child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                                child: Image.network(
                                                  "${cont.searchDoctorbySpecialitylist[index].productImage}" ??
                                                      "",
                                                  fit: BoxFit.cover,
                                                  width: 100.w,
                                                  height: 120.h,
                                                ),
                                              ),
                                              SizedBox(width: 10.w),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CustomText(
                                                    text: doctor.productName,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18.sp,
                                                    fontColor:
                                                        Color(0xff000000),
                                                  ),
                                                  SizedBox(height: 5.h),
                                                  SizedBox(
                                                    width: 150.w,
                                                    child: CustomText(
                                                      text: doctor
                                                          .productDescription,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18.sp,
                                                      fontColor:
                                                          Color(0xff000000),
                                                    ),
                                                  ),
                                                  SizedBox(height: 5.h),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      CustomText(
                                                        text:
                                                            doctor.productPrice,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14.sp,
                                                        fontColor: kYellow,
                                                      ),
                                                      SizedBox(width: 90),
                                                      GestureDetector(
                                                          onTap: () {
                                                            dataBaseHelper
                                                                .insert(
                                                              GetProductCartModel(
                                                                productId: cont
                                                                    .searchDoctorbySpecialitylist[
                                                                        index]
                                                                    .id??"",
                                                                productName: cont
                                                                    .searchDoctorbySpecialitylist[
                                                                        index]
                                                                    .productName??"",
                                                                productImage: cont
                                                                    .searchDoctorbySpecialitylist[
                                                                        index]
                                                                    .productImage??"",
                                                                quantity: 1,
                                                                productPrice: cont
                                                                    .searchDoctorbySpecialitylist[
                                                                        index]
                                                                    .productPrice??"",
                                                              ),
                                                            )
                                                                .then((v) {
                                                              getProductCartProvider
                                                                  .addItems();
                                                              print(
                                                                  "add to cart success");
                                                            });
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                              content: Text(
                                                                  "${doctor.productName ?? ''}has been added to your cart"),
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          2),
                                                            ));
                                                          },
                                                          child: CustomCard(
                                                              height: 40.h,
                                                              width: 90.w,
                                                              cardRadius: 10,
                                                              cardColor:
                                                                  kYellow,
                                                              cardChild: Center(
                                                                  child:
                                                                      CustomText(
                                                                text:
                                                                    "Add to cart",
                                                                fontColor:
                                                                    Colors
                                                                        .white,
                                                              ))))
                                                    ],
                                                  ),
                                                  SizedBox(height: 5.h),
                                                  Row(
                                                    children: [],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Divider()
                                    ],
                                  ),
                                );
                              },
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
