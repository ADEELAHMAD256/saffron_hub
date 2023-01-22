import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:saffron_hub/models/cart_model.dart';

import '../models/get_prroduct_cart_model.dart';

class DataBaseHelper {
  static Database? _database;

  Future<Database?> get dataBase async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDateBse();
    return null;
    // return dataBase;
  }

  initDateBse() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "cart.dataBase");
    var dbase = await openDatabase(
      path,
      version: 5,
      onCreate: _onCreate,
    );
    return dbase;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE productcart (id INTEGER PRIMARY KEY , productId VARCHAR UNIQUE,productName TEXT, productImage TEXT, quantity INTEGER, productPrice TEXT )');
  }

  Future<GetProductCartModel> insert(GetProductCartModel cart) async {
    var dbClient = await dataBase;
    await dbClient!.insert("productcart", cart.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return cart;
  }

  Future<List<GetProductCartModel>> getCartList() async {
    var dbClient = await dataBase;
    final List<Map<String, Object?>> result =
        await dbClient!.query("productcart");
    return result.map((e) => GetProductCartModel.fromMap(e)).toList();
  }

  Future<int> remove(String id) async {
    var dbClient = await dataBase;
    return await dbClient!
        .delete("productcart", where: "productId = ?", whereArgs: [id]);
  }

  Future<int> updateQuantity(Cart cart) async {
    var dbClient = await dataBase;
    return await dbClient!.update("productcart", cart.toMap(),
        where: "productId = ?", whereArgs: [cart.productId]);
  }
}
