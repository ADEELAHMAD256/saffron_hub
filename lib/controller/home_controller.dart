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
import '../models/HistoryModel.dart';
import '../models/cart_model.dart';
import '../models/get_check_out_model.dart';
import '../models/product_model.dart';
import '../view/History/history_list.dart';

class HomeController extends GetxController {
  TextEditingController firstName=TextEditingController();
  TextEditingController lastName=TextEditingController();
  TextEditingController emailName=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController description=TextEditingController();
  List<HistoryModel> processing = [];
  List<HistoryModel> delivered = [];
  List<HistoryModel> completed = [];
  List<HistoryModel> cancelled = [];
  RxBool loading = false.obs;
  int selected = 0;
  CheckOutModel checkOutModel = CheckOutModel();
  ApiClient api = ApiClient(appBaseUrl: baseUrl);
  ApiChecker apichecker = ApiChecker();
  var auth = Get.find<AuthController>();
  List<String> jobsTypes = ["Processing", "Delivered", "Completed", "Canceled"];
  List<ProductModel> getproductcart= [];
  RxList<ProductsList> searchDoctorbySpecialitydata = RxList<ProductsList>([]);
  // RxList<GetProductCartModel> getProductCartModel = RxList<GetProductCartModel>([]);
  // List<GetProductCartModel> get getProductCartModellist =>
  //     getProductCartModel.value;
  List<ProductsList> get searchDoctorbySpecialitylist =>
      searchDoctorbySpecialitydata.value;

  @override
  Future<void> onInit() async {
    

    await getMyDoctor();
    getOrderProcessingList();
    getOrderDeliveredList();
    getOrderCompletedList();
    getOrderCancelledList();
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
    print(jsonEncode(getproductcart));
  Response response = await api.postData(

      "api/checkout",
      {
        "customer_id": auth.user?.userId.toString(),
        "products": jsonEncode(getproductcart).toString(),
        "delivery_address": address.text.toString(),
        "total_bill": "600",
      },
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': "*",
        'Authorization': 'Bearer ${auth.user?.accessToken.toString()}'
      },

      showdialog: false);
  print(response.statusCode);
  if (response == null) {
    errorAlert('Check your internet connection.');
  } else if (response.statusCode == 200) {
    Get.close(3);
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
  Future<void> getOrderProcessingList() async {
    Response response = await api.getData(
        "api/getOrderProcessingList",
      query:{ "customer_id":auth.user?.userId.toString()},
       headers: {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': "*",
    'Authorization': 'Bearer ${auth.user?.accessToken.toString()}'
    },
    );
    if (response == null) {
      errorAlert('Check your internet connection.');
    } else if (response.statusCode == 200) {
      var json = response.body;
      if (json['orders_list']['data'] != null) {
        processing = <HistoryModel>[].obs;
        json['orders_list']['data'].forEach((v) {
          processing.add(HistoryModel.fromJson(v));
        });
      }

    } else {
      errorAlert('Something went wrong\nPlease try again!');
    }
    update();
  }
  Future<void> getOrderDeliveredList() async {
    Response response = await api.getData(
        "api/getOrderDeliveredList",
      query:{ "customer_id":auth.user?.userId.toString()},
       headers: {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': "*",
    'Authorization': 'Bearer ${auth.user?.accessToken.toString()}'
    },
    );
    if (response == null) {
      errorAlert('Check your internet connection.');
    } else if (response.statusCode == 200) {
      var json = response.body;
      if (json['orders_list']['data'] != null) {
        delivered = <HistoryModel>[].obs;
        json['orders_list']['data'].forEach((v) {
          delivered.add(HistoryModel.fromJson(v));
        });
      }

    } else {
      errorAlert('Something went wrong\nPlease try again!');
    }
    update();
  }
  Future<void> getOrderCompletedList() async {
    Response response = await api.getData(
        "api/getOrderCompletedList",
      query:{ "customer_id":auth.user?.userId.toString()},
       headers: {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': "*",
    'Authorization': 'Bearer ${auth.user?.accessToken.toString()}'
    },
    );
    if (response == null) {
      errorAlert('Check your internet connection.');
    } else if (response.statusCode == 200) {
      var json = response.body;
      if (json['orders_list']['data'] != null) {
        delivered = <HistoryModel>[].obs;
        json['orders_list']['data'].forEach((v) {
          delivered.add(HistoryModel.fromJson(v));
        });
      }

    } else {
      errorAlert('Something went wrong\nPlease try again!');
    }
    update();
  }
  Future<void> getOrderCancelledList() async {
    Response response = await api.getData(
        "api/getOrderCancelledList",
      query:{ "customer_id":auth.user?.userId.toString()},
       headers: {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': "*",
    'Authorization': 'Bearer ${auth.user?.accessToken.toString()}'
    },
    );
    if (response == null) {
      errorAlert('Check your internet connection.');
    } else if (response.statusCode == 200) {
      var json = response.body;
      if (json['orders_list']['data'] != null) {
        cancelled = <HistoryModel>[].obs;
        json['orders_list']['data'].forEach((v) {
          cancelled.add(HistoryModel.fromJson(v));
        });
      }

    } else {
      errorAlert('Something went wrong\nPlease try again!');
    }
    update();
  }


  Widget getScreen() {
    List<HistoryModel> historyData = [];
    if (selected == 0) {
      historyData = processing;
    } else if (selected == 1) {
      historyData = delivered;
    } else if (selected == 2) {
      historyData = completed;
    } else {
      historyData = cancelled;
    }
    if (selected == 0) {
      return RefreshIndicator(
          onRefresh: () {
            return getOrderProcessingList();
          },
          child: HistoryList(historyData: historyData,));
    }
    else if (selected == 1) {
      return RefreshIndicator(
          onRefresh: () {
            return getOrderDeliveredList();
          },
          child: HistoryList(historyData: historyData,));
    }
    else if (selected == 2) {
      return RefreshIndicator(
          onRefresh: () {
            return getOrderCompletedList();
          },
          child: HistoryList(historyData: historyData,));
    }
    else {
      return RefreshIndicator(
          onRefresh: () {
            return getOrderCancelledList();
          },
          child: HistoryList(historyData: historyData,));

    }
  }
  }

