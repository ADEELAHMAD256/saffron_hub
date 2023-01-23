import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:saffron_hub/components/custom_card/custom_card.dart';
import 'package:saffron_hub/components/custom_text/text.dart';
import 'package:saffron_hub/consts/const_colors.dart';
import '../../controller/home_controller.dart';
import '../../db_helper/data_base.dart';
import '../../models/get_prroduct_cart_model.dart';
import 'package:get/get.dart';
import '../../provider/get_product_cart_provider.dart';

class GetProductCartScreen extends StatelessWidget {
  static const String id = "AddToCartScreen";
  late GetProductCartProvider getProductCartProvider;
  DataBaseHelper getProductDataBse = DataBaseHelper();
  GetProductCartScreen({Key? key}) : super(key: key);

  var home = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    getProductCartProvider = Provider.of<GetProductCartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(
          text: "Get Product Cart",
          fontSize: 25.sp,
        ),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: getProductCartProvider.getData(),
            builder:
                (context, AsyncSnapshot<List<GetProductCartModel>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return Center(
                    child: Column(
                      children: [
                        CustomText(
                          text: "Cart is empty",
                          fontSize: 25.sp,
                        ),
                        Image.asset("assets/images/e.cart.png")
                      ],
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          CustomCard(
                            height: 90.h,
                            width: 335.w,
                            cardRadius: 11,
                            border: Border.all(color: Colors.black38),
                            cardChild: Row(
                              children: [
                                CustomCard(
                                  width: 65.w,
                                  cardRadius: 0,
                                  cardChild: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    child: Image.network(
                                      snapshot.data![index].productImage,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  children: [
                                    SizedBox(height: 10.h),
                                    SizedBox(
                                      width: 180.w,
                                      height: 25.h,
                                      child: CustomText(
                                        text: snapshot.data![index].productName,
                                        fontSize: 18.sp,
                                        // textOverflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 180.w,
                                      height: 20.h,
                                      child: CustomText(
                                        text:
                                            snapshot.data![index].productPrice,
                                        fontSize: 16.sp, fontColor: kYellow,
                                        // textOverflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        getProductDataBse.remove(
                                            snapshot.data![index].productId);
                                        getProductCartProvider.removeItems();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              "${snapshot.data![index].productName}has been removed from your cart"),
                                          duration: Duration(seconds: 2),
                                        ));
                                      },
                                      child: Icon(Icons.delete),
                                    ),
                                    // SizedBox(height: 20.h),
                                    // Row(
                                    //   children: [
                                    //     InkWell(
                                    //         onTap: () {
                                    //           int quantity = snapshot
                                    //               .data![index].quantity;
                                    //           quantity--;
                                    //           dataBse
                                    //               .updateQuantity(Cart(
                                    //                   productId: snapshot
                                    //                       .data![index]
                                    //                       .productId,
                                    //                   quantity: quantity,
                                    //                   productName: snapshot
                                    //                       .data![index]
                                    //                       .productName,
                                    //                   productImage: snapshot
                                    //                       .data![index]
                                    //                       .productImage))
                                    //               .then((value) {
                                    //             quantity = 0;
                                    //           }).onError((error, stackTrace) {
                                    //             print(error.toString());
                                    //           });
                                    //         },
                                    //         child: Icon(Icons.remove)),
                                    //     CustomText(
                                    //       text: snapshot.data![index].quantity
                                    //           .toString(),
                                    //     ),
                                    //     InkWell(
                                    //         onTap: () {
                                    //           int quantity = snapshot
                                    //               .data![index].quantity;
                                    //           quantity + 1;
                                    //           dataBse
                                    //               .updateQuantity(Cart(
                                    //                   productId: snapshot
                                    //                       .data![index]
                                    //                       .productId,
                                    //                   quantity: quantity,
                                    //                   productName: snapshot
                                    //                       .data![index]
                                    //                       .productName,
                                    //                   productImage: snapshot
                                    //                       .data![index]
                                    //                       .productImage))
                                    //               .then((value) {
                                    //             quantity = 0;
                                    //           }).onError((error, stackTrace) {
                                    //             print(error.toString());
                                    //           });
                                    //         },
                                    //         child: Icon(Icons.add))
                                    //   ],
                                    // )
                                  ],
                                ),
                                SizedBox(width: 5.w),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                  );
                }
              } else {
                return Container(
                  // height: 100,
                  // width: 100,
                  // color: Colors.green,
                );
              }
            },
          )
        ],
      ),
      bottomNavigationBar: FutureBuilder(
        future: getProductCartProvider.getData(),
        builder: (BuildContext context,
            AsyncSnapshot<List<GetProductCartModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return SizedBox();
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      home.checkout();
                    },
                    child: CustomCard(
                      height: 50,
                      width: 335,
                      cardRadius: 10,
                      cardColor: Colors.black38,
                      cardChild: Center(
                        child: CustomText(
                          text: "Check Out",
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          fontColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h)
                ],
              );
            }
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
