// ignore_for_file: unnecessary_null_comparison
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:saffron_hub/api/api_checker.dart';
import 'package:saffron_hub/api/api_client.dart';
import 'package:saffron_hub/controller/auth_controller.dart';
import 'package:saffron_hub/models/get_prroduct_cart_model.dart';
import 'package:saffron_hub/models/getproductbystore.dart';
import 'package:saffron_hub/provider/get_product_cart_provider.dart';
import 'package:saffron_hub/utils/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../consts/base_url.dart';
import '../models/get_check_out_model.dart';

class HomeController extends GetxController {
  RxBool loading = false.obs;
  CheckOutModel checkOutModel = CheckOutModel();
  ApiClient api = ApiClient(appBaseUrl: baseUrl);
  ApiChecker apichecker = ApiChecker();
  var auth = Get.find<AuthController>();


  List<GetProductCartModel> getproductcart= [];
  RxList<ProductsList> searchDoctorbySpecialitydata = RxList<ProductsList>([]);
  // RxList<GetProductCartModel> getProductCartModel = RxList<GetProductCartModel>([]);
  // List<GetProductCartModel> get getProductCartModellist =>
  //     getProductCartModel.value;
  List<ProductsList> get searchDoctorbySpecialitylist =>
      searchDoctorbySpecialitydata.value;

  @override
  Future<void> onInit() async {
    

    await getMyDoctor();
    super.onInit();

  }

  // Future getCheckOUt() async {
  //   // Map<String, String> headers = {
  //   //   "Content-type": "application/json",
  //   //   'Authorization': 'Bearer $token',
  //   // };
  //
  //   var url = "${AppConstants.baseUrl}checkout";
  //
  //   final response = await _dio.get(url);
  //
  //   if (response.statusCode == 200) {
  //     return CheckOutModel.fromJson(json.decode(response.data));
  //     // return bookFromJson(response.body).user;
  //   } else {
  //     // If that call was not successful, throw an error.
  //     throw Exception('Failed to load post');
  //   }
  // }
  Future checkout() async {
  Response response = await api.postData(

      "api/checkout",
      {
        "customer_id": auth.user?.userId,
        "products": jsonEncode(getproductcart),
        "delivery_address": "Lahore",
        "total_bill": "600",
      },

      showdialog: false);
  print(response.statusCode);
  if (response == null) {
    errorAlert('Check your internet connection.');
  } else if (response.statusCode == 200) {
    print(response.statusCode);
    // await prefs.setString(
    //     AppConstants().token, response.body["access_token"]);
    // onLoginSuccess(response.body);
    //Get.offAll(HomeScreen());
    //loading.value = false;
  } else {
    errorAlert('Something went wrong\nPlease try again!');
  }
    update();
  }

  Future getMyDoctor() async {
    Response response = await api.postData(
        "api/getProductList",
        {
          //"user_id": auth.user?.userId,
        },
        showdialog: false);
    if (response == null) {
      errorAlert('Check your internet connection.');
    } else if (response.statusCode == 200) {
      var json = response.body;
      //specialityListdata = SpecialityListModel.fromJson(json).;
      if (json['products_list'] != null) {
        searchDoctorbySpecialitydata = <ProductsList>[].obs;
        json['products_list'].forEach((v) {
          searchDoctorbySpecialitydata.add(ProductsList.fromJson(v));
        });
      }
    } else {
      errorAlert('Something went wrong\nPlease try again!');
    }
    update();
  }
}
