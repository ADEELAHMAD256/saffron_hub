class Cart {
  // late final int? id;
  final String productId;
  final String productName;
  final String productImage;
  final int quantity;

  Cart({
    required this.productId,
    required this.quantity,
    required this.productName,
    required this.productImage,
  });

  Cart.fromMap(Map<dynamic, dynamic> res)
      : quantity = res["quantity"],
        productId = res["productId"],
        productName = res["productName"],
        productImage = res["productImage"];
  Map<String, Object?> toMap() {
    return {
      "quantity": quantity,
      "productId": productId,
      "productName": productName,
      "productImage": productImage
    };
  }
}
