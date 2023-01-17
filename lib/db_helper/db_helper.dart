import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:saffron_hub/models/cart_model.dart';

class DBHelper {
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
    var db = await openDatabase(
      path,
      version: 5,
      onCreate: _onCreate,
    );
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart (id INTEGER PRIMARY KEY , productId VARCHAR UNIQUE,productName TEXT, productImage TEXT, quantity INTEGER )');
  }

  Future<Cart> insert(Cart cart) async {
    var dbClient = await dataBase;
    await dbClient!.insert("cart", cart.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return cart;
  }

  Future<List<Cart>> getCartList() async {
    var dbClient = await dataBase;
    final List<Map<String, Object?>> result = await dbClient!.query("cart");
    return result.map((e) => Cart.fromMap(e)).toList();
  }

  Future<int> remove(String id) async {
    var dbClient = await dataBase;
    return await dbClient!
        .delete("cart", where: "productId = ?", whereArgs: [id]);
  }

  Future<int> updateQuantity(Cart cart) async {
    var dbClient = await dataBase;
    return await dbClient!.update("cart", cart.toMap(),
        where: "productId = ?", whereArgs: [cart.productId]);
  }
}
