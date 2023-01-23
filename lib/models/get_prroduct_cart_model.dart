class GetProductCartModel {
  // late final int? id;
  final String productId;
  final String productName;
  final String productImage;
  final String productPrice;
  final int quantity;

  GetProductCartModel({
    // this.id,
    required this.productId,
    required this.quantity,
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });

  GetProductCartModel.fromMap(Map<dynamic, dynamic> res)
      : productId = res["productId"],
        quantity = res["quantity"],
        productPrice = res["productPrice"],
        productName = res["productName"],
        productImage = res["productImage"];
  Map<String, Object?> toMap() {
    return {
      "productId": productId,
      "quantity": quantity,
      "productPrice": productPrice,
      "productName": productName,
      "productImage": productImage
    };
  }
}
