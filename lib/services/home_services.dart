import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:saffron_hub/consts/base_url.dart';
import 'package:saffron_hub/models/banner_model.dart';
import '../models/restaurants_list_model.dart';

class HomeServices {
  final _dio = Dio();
  List<RestaurantsListModel>? restaurantsList;

  ///=============================================================================  BannersModel

  Future<BannersModel> getBannersModel() async {
    try {
      const url = '${AppConstants.baseUrl}home/banners';
      final response = await _dio.post(url);
      if (response.statusCode != 200) {
        throw response.data;
      }
      // print('Banners Response : ${response.data}');
      print(response.data);
      return BannersModel.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }

  ///================================================================================  Rlm

  Future<List<RestaurantsListModel>?> getRestaurantsListModel() async {
    try {
      const url = '${AppConstants.baseUrl}home/food-vendors';
      final response = await _dio.post(url);
      // print('>>> ${response.data}');
      // restaurantsList!.add(jsonDecode(response.data)
      //     .map((items) => RestaurantsListModel.fromJson(items))
      //     .toList()
      //     .cast<RestaurantsListModel>());
      if (response.statusCode != 200) {

        throw response.data;
      }else if(response.statusCode == 200){
        restaurantsList = [];
        List data = response.data;
        print(jsonEncode(data));
        // var data = jsonDecode(response.data);
        for (var element in data) {
          print('>>>  element');
          RestaurantsListModel rlm = RestaurantsListModel.fromJson(element);
          restaurantsList!.add(rlm);
        }

      }
      // print('Response data : ${response.data}');

      return restaurantsList;
    } catch (_) {
      rethrow;
    }
  }
}
