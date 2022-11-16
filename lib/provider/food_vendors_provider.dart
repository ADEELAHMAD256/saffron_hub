import 'package:flutter/cupertino.dart';
import 'package:saffron_hub/models/vendors_model.dart';
import 'package:saffron_hub/services/food_vendors_services.dart';
import '../models/food_vendor_model.dart';

class FoodVendorsProvider extends ChangeNotifier {
  late FoodVendorModel foodVendorModel;
  bool isLoadingF = true;

  Future<void> getFoodVendorDat00a() async {
    try {
      // foodVendorModel = await FoodVendorsServices().getFoodVendor();
      isLoadingF = true;
      notifyListeners();
      // log('Food vendors - ${foodVendorModel}');
      isLoadingF = false;
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  late Vendors vendors;
  late int currentVendor;
  int? currentPage = 1;
  List<Data>? foodVendors;
  Future getAllFoodVendors() async {
    try {
      vendors = await FoodVendorsServices().getAllFoodVendors(currentPage);
      isLoadingF = true;
      notifyListeners();
      // log('Food vendors - ${foodVendorModel}');
      isLoadingF = false;
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  //Search
  late Data searchedVendor;
  late bool searchedMode = false;
}
