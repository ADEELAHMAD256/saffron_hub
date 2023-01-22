// ignore_for_file: unnecessary_null_comparison
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:saffron_hub/api/api_checker.dart';
import 'package:saffron_hub/api/api_client.dart';
import 'package:saffron_hub/controller/auth_controller.dart';
import 'package:saffron_hub/models/getproductbystore.dart';
import 'package:saffron_hub/utils/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxBool loading = false.obs;
  ApiClient api = ApiClient(appBaseUrl: baseUrl);
  ApiChecker apichecker = ApiChecker();
  var auth = Get.find<AuthController>();
  RxList<ProductsList> searchDoctorbySpecialitydata = RxList<ProductsList>([]);
  List<ProductsList> get searchDoctorbySpecialitylist =>
      searchDoctorbySpecialitydata.value;

  @override
  Future<void> onInit() async {
    await getMyDoctor();
    super.onInit();
  }
  Future checkout() async {
    Response response = await api.postData(
        "api/checkout",
        {
          "customer_id": auth.user?.userId,
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
