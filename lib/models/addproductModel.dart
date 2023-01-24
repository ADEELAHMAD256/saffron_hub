class Addproductmodel {
  int? productId;
  int? productQuantity;
  int? productPrice;

  Addproductmodel({this.productId, this.productQuantity, this.productPrice});

  Addproductmodel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productQuantity = json['product_quantity'];
    productPrice = json['product_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_quantity'] = this.productQuantity;
    data['product_price'] = this.productPrice;
    return data;
  }
}
