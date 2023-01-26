/// id : 5
/// customer_name : "Usman"
/// customer_profile_picture : "https://saffronhub.citizensadgrace.com/public/storage/profile-pics/profilePicture_167414168843304685.png"
/// total_bill : "1000"
/// payment_type : "cash on delivery"
/// delivery_address : "Faisalabad, Pakistan"
/// created_at : "2023-01-22T17:23:03.000000Z"
/// order_details : [{"product_id":"1","product_quantity":"2","product_name":"Chicken Burger","product_description":"Chicken Burger","product_image":"https://saffronhub.citizensadgrace.com/public/storage/products/productImage_167412427264602482.png"}]

class HistoryModel {
  HistoryModel({
      num? id, 
      String? customerName, 
      String? customerProfilePicture, 
      String? totalBill, 
      String? paymentType, 
      String? deliveryAddress, 
      String? createdAt, 
      List<OrderDetails>? orderDetails,}){
    _id = id;
    _customerName = customerName;
    _customerProfilePicture = customerProfilePicture;
    _totalBill = totalBill;
    _paymentType = paymentType;
    _deliveryAddress = deliveryAddress;
    _createdAt = createdAt;
    _orderDetails = orderDetails;
}

  HistoryModel.fromJson(dynamic json) {
    _id = json['id'];
    _customerName = json['customer_name'];
    _customerProfilePicture = json['customer_profile_picture'];
    _totalBill = json['total_bill'];
    _paymentType = json['payment_type'];
    _deliveryAddress = json['delivery_address'];
    _createdAt = json['created_at'];
    if (json['order_details'] != null) {
      _orderDetails = [];
      json['order_details'].forEach((v) {
        _orderDetails?.add(OrderDetails.fromJson(v));
      });
    }
  }
  num? _id;
  String? _customerName;
  String? _customerProfilePicture;
  String? _totalBill;
  String? _paymentType;
  String? _deliveryAddress;
  String? _createdAt;
  List<OrderDetails>? _orderDetails;
HistoryModel copyWith({  num? id,
  String? customerName,
  String? customerProfilePicture,
  String? totalBill,
  String? paymentType,
  String? deliveryAddress,
  String? createdAt,
  List<OrderDetails>? orderDetails,
}) => HistoryModel(  id: id ?? _id,
  customerName: customerName ?? _customerName,
  customerProfilePicture: customerProfilePicture ?? _customerProfilePicture,
  totalBill: totalBill ?? _totalBill,
  paymentType: paymentType ?? _paymentType,
  deliveryAddress: deliveryAddress ?? _deliveryAddress,
  createdAt: createdAt ?? _createdAt,
  orderDetails: orderDetails ?? _orderDetails,
);
  num? get id => _id;
  String? get customerName => _customerName;
  String? get customerProfilePicture => _customerProfilePicture;
  String? get totalBill => _totalBill;
  String? get paymentType => _paymentType;
  String? get deliveryAddress => _deliveryAddress;
  String? get createdAt => _createdAt;
  List<OrderDetails>? get orderDetails => _orderDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['customer_name'] = _customerName;
    map['customer_profile_picture'] = _customerProfilePicture;
    map['total_bill'] = _totalBill;
    map['payment_type'] = _paymentType;
    map['delivery_address'] = _deliveryAddress;
    map['created_at'] = _createdAt;
    if (_orderDetails != null) {
      map['order_details'] = _orderDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// product_id : "1"
/// product_quantity : "2"
/// product_name : "Chicken Burger"
/// product_description : "Chicken Burger"
/// product_image : "https://saffronhub.citizensadgrace.com/public/storage/products/productImage_167412427264602482.png"

class OrderDetails {
  OrderDetails({
      String? productId, 
      String? productQuantity, 
      String? productName, 
      String? productDescription, 
      String? productImage,}){
    _productId = productId;
    _productQuantity = productQuantity;
    _productName = productName;
    _productDescription = productDescription;
    _productImage = productImage;
}

  OrderDetails.fromJson(dynamic json) {
    _productId = json['product_id'];
    _productQuantity = json['product_quantity'];
    _productName = json['product_name'];
    _productDescription = json['product_description'];
    _productImage = json['product_image'];
  }
  String? _productId;
  String? _productQuantity;
  String? _productName;
  String? _productDescription;
  String? _productImage;
OrderDetails copyWith({  String? productId,
  String? productQuantity,
  String? productName,
  String? productDescription,
  String? productImage,
}) => OrderDetails(  productId: productId ?? _productId,
  productQuantity: productQuantity ?? _productQuantity,
  productName: productName ?? _productName,
  productDescription: productDescription ?? _productDescription,
  productImage: productImage ?? _productImage,
);
  String? get productId => _productId;
  String? get productQuantity => _productQuantity;
  String? get productName => _productName;
  String? get productDescription => _productDescription;
  String? get productImage => _productImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['product_quantity'] = _productQuantity;
    map['product_name'] = _productName;
    map['product_description'] = _productDescription;
    map['product_image'] = _productImage;
    return map;
  }

}