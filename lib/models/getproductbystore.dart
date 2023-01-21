class GetProductbystore {
  bool? status;
  List<ProductsList>? productsList;

  GetProductbystore({this.status, this.productsList});

  GetProductbystore.fromJson(Map<String, dynamic> json) {
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