import 'dart:convert';

CheckOutModel bookFromJson(String str) =>
    CheckOutModel.fromJson(json.decode(str));

String bookToJson(CheckOutModel data) => json.encode(data.toJson());

class CheckOutModel {
  CheckOutModel({
    this.status,
    this.deliveryAddress,
    this.totalBill,
    this.message,
    this.user,
  });

  bool? status;
  String? message;
  List<User>? user;
  String? deliveryAddress;
  String? totalBill;

  factory CheckOutModel.fromJson(Map<String, dynamic> json) => CheckOutModel(
        status: json["status"],
        message: json["message"],
        deliveryAddress: json["delivery_address"],
        totalBill: json["total_bill"],
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user": List<dynamic>.from(user!.map((x) => x.toJson())),
      };
}

class User {
  User({
    this.productId,
    this.productQuantity,
    this.productPrice,
  });

  String? productId;
  String? productQuantity;
  String? productPrice;

  factory User.fromJson(Map<String, dynamic> json) => User(
        productId: json["product_id"],
        productQuantity: json["product_quantity"],
        productPrice: json["product_price"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_quantity": productQuantity,
        "product_price": productPrice,
      };
}
