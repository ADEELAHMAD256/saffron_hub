import 'package:flutter/cupertino.dart';
import 'package:saffron_hub/db_helper/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  DBHelper dataBse = DBHelper();
  int counter = 0;
  // int get counter => _counter;

  late Future<List<Cart>> _cart;
  // Future<List<Cart>> get cart => _cart;

  Future<List<Cart>> getData() async {
    return _cart = dataBse.getCartList();
  }

  void _setRrefItems() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("cart_items", counter);
    notifyListeners();
  }

  void _getRrefItems() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    counter = sharedPreferences.getInt("cart_items") ?? 0;
    notifyListeners();
  }

  void addItems() {
    counter++;
    _setRrefItems();
    notifyListeners();
  }

  void removeItems() {
    counter--;
    _setRrefItems();
    notifyListeners();
  }

  int getCounterValue() {
    _getRrefItems();
    return counter;
  }
}
