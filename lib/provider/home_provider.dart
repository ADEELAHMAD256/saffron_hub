import 'package:flutter/cupertino.dart';
import 'package:saffron_hub/models/restaurants_list_model.dart';
import 'package:saffron_hub/models/banner_model.dart';
import 'package:saffron_hub/services/home_services.dart';

class HomeProvider extends ChangeNotifier {
  late BannersModel bannersModel;
  late List<RestaurantsListModel>? restaurantsListModel;

  bool isLoading = true;
  bool isLoadingR = true;
  late int currentVendor;

  Future<void> getBanners() async {
    try {
      bannersModel = (await HomeServices().getBannersModel());
      isLoading = true;
      notifyListeners();

      // log('Total Banners length - $bannersModel');
      isLoading = false;
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getRlm() async {
    try {
      restaurantsListModel = (await HomeServices().getRestaurantsListModel())!;
      isLoadingR = true;
      notifyListeners();

      // log('This is email - ${restaurantsListModel.email}');
      isLoadingR = false;
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }
}
