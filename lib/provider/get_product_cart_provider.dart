import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import '../models/cart_model.dart';
import '../db_helper/data_base.dart';
import '../models/get_prroduct_cart_model.dart';

class GetProductCartProvider extends ChangeNotifier {
  DataBaseHelper dataBase = DataBaseHelper();
  int counter = 0;

  late Future<List<GetProductCartModel>> _cartList;

  Future<List<GetProductCartModel>> getData() async {
    return _cartList = dataBase.getCartList();
  }

  void _setRreItems() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("cartlist_items", counter);
    notifyListeners();
  }

  void _getRreItems() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    counter = sharedPreferences.getInt("cartlist_items") ?? 0;
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
