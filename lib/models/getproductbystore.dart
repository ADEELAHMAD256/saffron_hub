// import 'dart:convert';
//
// GetProductModel getProductModelFromMap(String str) =>
//     GetProductModel.fromMap(json.decode(str));
//
// String getProductModelToMap(GetProductModel data) => json.encode(data.toMap());
//
// class GetProductModel {
//   GetProductModel({
//     required this.status,
//     required this.productsList,
//   });
//
//   bool status;
//   List<ProductsList> productsList;
//
//   factory GetProductModel.fromMap(Map<String, dynamic> json) => GetProductModel(
//         status: json["status"],
//         productsList: List<ProductsList>.from(
//             json["products_list"].map((x) => ProductsList.fromMap(x))),
//       );
//
//   Map<String, dynamic> toMap() => {
//         "status": status,
//         "products_list": List<dynamic>.from(productsList.map((x) => x.toMap())),
//       };
// }
//
// class ProductsList {
//   ProductsList({
//     required this.id,
//     required this.productName,
//     required this.productPrice,
//     required this.productDescription,
//     required this.productImage,
//   });
//
//   String id;
//   String productName;
//   String productPrice;
//   String productDescription;
//   String productImage;
//
//   factory ProductsList.fromMap(Map<String, dynamic> json) => ProductsList(
//         id: json["id"],
//         productName: json["product_name"],
//         productPrice: json["product_price"],
//         productDescription: json["product_description"],
//         productImage: json["ProductImage"],
//       );
//
//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "product_name": productName,
//         "product_price": productPrice,
//         "product_description": productDescription,
//         "ProductImage": productImage,
//       };
// }

class ProductsListModel {
  bool? status;
  List<ProductsList>? productsList;

  ProductsListModel({this.status, this.productsList});

  ProductsListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['products_list'] != null) {
      productsList = <ProductsList>[];
      json['products_list'].forEach((v) {
        productsList!.add(new ProductsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.productsList != null) {
      data['products_list'] =
          this.productsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsList {
  String? id;
  String? productName;
  String? productPrice;
  String? productDescription;
  String? productImage;

  ProductsList(
      {this.id,
      this.productName,
      this.productPrice,
      this.productDescription,
      this.productImage});

  ProductsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productDescription = json['product_description'];
    productImage = json['ProductImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    data['product_description'] = this.productDescription;
    data['ProductImage'] = this.productImage;
    return data;
  }
}
