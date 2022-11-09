import 'package:flutter/cupertino.dart';
import 'package:saffron_hub/services/food_vendors_services.dart';
import '../models/food_vendor_model.dart';

class FoodVendorsProvider extends ChangeNotifier {
  late FoodVendorModel foodVendorModel;
  bool isLoadingF = true;

  Future<void> getFoodVendorData() async {
    try {
      foodVendorModel = await FoodVendorsServices().getFoodVendor();
      isLoadingF = true;
      notifyListeners();
      // log('Food vendors - ${foodVendorModel}');
      isLoadingF = false;
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }
}
