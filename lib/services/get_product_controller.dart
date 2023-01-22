import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:saffron_hub/api/api_client.dart';
import 'package:saffron_hub/consts/base_url.dart';
import 'package:saffron_hub/models/banner_model.dart';
import '../models/get_product_model.dart';
import '../models/getproductbystore.dart';
import '../models/restaurants_list_model.dart';

class GetProductServices {
  final _dio = Dio();
  late List<GetProductModel>? getProductModel;

  // Future<GetProductModel?> getProduct() async {
  //   var responce = await _dio.post("${AppConstants.baseUrl}getProductList");
  //   if (responce.statusCode == 200) {
  //     var jsonSting = responce.data;
  //     return getProductModelFromMap(jsonSting);
  //   } else {
  //     return null;
  //   }
  // }

  // Future<GetProductModel> getGetProductListModel() async {
  //   print("Start");
  //   final response = await _dio.get("${AppConstants.baseUrl}getProductList");
  //   print(response.statusCode);
  //   var data = jsonDecode(response.data.toString());
  //
  //   if (response.statusCode == 200) {
  //     print(" success >>>>>>${response.data}");
  //     return GetProductModel.fromJson(data);
  //   } else {
  //     print(response.statusCode);
  //     return GetProductModel.fromJson(data);
  //   }
  // }

  Future<List<GetProductModel>?> getGetProductListModel() async {
    try {
      const url = 'http://saffronhub.citizensadgrace.com/api/getProductList';
      final response = await _dio.get(url);
      print('>>>++++++++++++ ${response.data}');
      getProductModel = [];
      List data = response.data;
      // var data = jsonDecode(response.data);
      for (var element in data) {
        print('>>>  element');
        GetProductModel grt = GetProductModel.fromJson(element);
        getProductModel!.add(grt);
      }
      // restaurantsList!.add(jsonDecode(response.data)
      //     .map((items) => RestaurantsListModel.fromJson(items))
      //     .toList()
      //     .cast<RestaurantsListModel>());
      if (response.statusCode == 200) {
        return response.data;
      }
      print('Response data : ${response.data}');

      return getProductModel;
    } catch (_) {
      rethrow;
    }
  }
}
