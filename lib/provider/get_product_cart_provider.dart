import 'package:flutter/cupertino.dart';
import 'package:saffron_hub/db_helper/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import '../models/cart_model.dart';
import '../view/get_product_cart/data_base.dart';

class GetProductCartProvider extends ChangeNotifier {
  DataBaseHelper dataBase = DataBaseHelper();
  int counter = 0;

  late Future<List<Cart>> _cart;

  Future<List<Cart>> getData() async {
    return _cart = dataBase.getCartList();
  }

  void _setRreItems() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("cart_items", counter);
    notifyListeners();
  }

  void _getRreItems() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    counter = sharedPreferences.getInt("cart_items") ?? 0;
    notifyListeners();
  }

  void addItems() {
    counter++;
    _setRreItems();
    notifyListeners();
  }

  void removeItems() {
    counter--;
    _setRreItems();
    notifyListeners();
  }

  int getCounterValue() {
    _getRreItems();
    return counter;
  }
}
