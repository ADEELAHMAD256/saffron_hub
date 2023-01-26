/// product_id : 1
/// product_quantity : 2
/// product_price : 500

class ProductModel {
  ProductModel({
    String? productId,
    String? productQuantity,
    String? productPrice,}){
    _productId = productId;
    _productQuantity = productQuantity;
    _productPrice = productPrice;
  }

  ProductModel.fromJson(dynamic json) {
    _productId = json['product_id'];
    _productQuantity = json['product_quantity'];
    _productPrice = json['product_price'];
  }
  String? _productId;
  String? _productQuantity;
  String? _productPrice;
  ProductModel copyWith({  String? productId,
    String? productQuantity,
    String? productPrice,
  }) => ProductModel(  productId: productId ?? _productId,
    productQuantity: productQuantity ?? _productQuantity,
    productPrice: productPrice ?? _productPrice,
  );
  String? get productId => _productId;
  String? get productQuantity => _productQuantity;
  String? get productPrice => _productPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['product_quantity'] = _productQuantity;
    map['product_price'] = _productPrice;
    return map;
  }

}