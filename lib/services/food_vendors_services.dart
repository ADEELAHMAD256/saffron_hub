import 'package:dio/dio.dart';
import 'package:saffron_hub/models/vendors_model.dart';
import '../consts/base_url.dart';
import '../models/food_vendor_model.dart';

class FoodVendorsServices {
  final _dio = Dio();

  Future<FoodVendorModel> getFoodVendor() async {
    try {
      const url = '${AppConstants.baseUrl}food-vendors/all';
      final response = await _dio.post(url);
      if (response.statusCode != 200) {
        throw response.data;
      }
      print('Food Vendor data : ${response.data}');
      return FoodVendorModel.fromMap(response.data);
    } catch (_) {
      rethrow;
    }
  }

  Future<Vendors> getAllFoodVendors() async {
    try {
      const url = '${AppConstants.baseUrl}food-vendors/all';
      final response = await _dio.post(url);
      if (response.statusCode != 200) {
        throw response.data;
      }
      print('Food Vendor data : ${response.data}');
      return Vendors.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }
}
