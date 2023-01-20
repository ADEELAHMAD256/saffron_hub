import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:saffron_hub/models/restaurants_list_model.dart';
import 'package:saffron_hub/models/banner_model.dart';
import 'package:saffron_hub/services/home_services.dart';

import '../models/get_product_model.dart';
import '../services/get_product_controller.dart';

class GetProductController extends ChangeNotifier {
  late GetProductModel getProductModel;

  bool isLoading = true;
  bool isLoadingR = true;
  // late int currentVendor;

  Future<void> getProductList() async {
    try {
      getProductModel = (await (GetProductServices().getGetProductListModel()));
      isLoadingR = true;
      notifyListeners();

      log('This is email }');
      isLoadingR = false;
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }
}
