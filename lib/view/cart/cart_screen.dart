import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:saffron_hub/components/custom_card/custom_card.dart';
import 'package:saffron_hub/components/custom_text/text.dart';
import 'package:saffron_hub/controller/home_controller.dart';
import 'package:saffron_hub/models/get_prroduct_cart_model.dart';
import 'package:saffron_hub/models/getproductbystore.dart';
import '../../db_helper/db_helper.dart';
import '../../models/cart_model.dart';
import '../../models/product_model.dart';
import '../../provider/cart_provider.dart';
import 'cart_verify.dart';

class AddToCartScreen extends StatelessWidget {
  static const String id = "AddToCartScreen";
  late CartProvider cartProvider;
  DBHelper dataBse = DBHelper();

  AddToCartScreen({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(
          text: "Cart",
          fontSize: 25.sp,
        ),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: cartProvider.getData(),
            builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
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
                      itemBuilder: (context, index) {
                        homeController.getproductcart.add(ProductModel(
                            productId: snapshot.data![index].productId.toString(),
                            productQuantity: snapshot.data![index].quantity.toString(),
                            productPrice: snapshot.data![index].productName));
                        print(jsonEncode(homeController.getproductcart));
                        print(homeController.getproductcart[index].productPrice);
                        return Column(
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
                                      child:CachedNetworkImage(
                                        imageUrl:snapshot.data![index].productImage??"",
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                              "assets/images/notImage.png",
                                              fit: BoxFit.fill,
                                            ),
                                        fit: BoxFit.fill,
                                      )
                                      // Image.network(
                                      //   snapshot.data![index].productImage,
                                      //   fit: BoxFit.fill,
                                      // ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  SizedBox(
                                    width: 180.w,
                                    height: 50.h,
                                    child: CustomText(
                                      text: snapshot.data![index].productName,
                                      fontSize: 18.sp,
                                      // textOverflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Spacer(),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          dataBse.remove(
                                              snapshot.data![index].productId);
                                          cartProvider.removeItems();
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
                        );
                      },
                    ),
                  );
                }
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: FutureBuilder(
        future: cartProvider.getData(),
        builder: (BuildContext context, AsyncSnapshot<List<Cart>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return SizedBox();
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartVerify(),
                      ),
                    ),
                    child: CustomCard(
                      height: 50,
                      width: 335,
                      cardRadius: 10,
                      cardColor: Colors.black38,
                      cardChild: Center(
                        child: CustomText(
                          text: "Submit for inquiry",
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
