// To parse this JSON data, do
//
//     final foodVendorModel = foodVendorModelFromMap(jsonString);

import 'dart:convert';

FoodVendorModel foodVendorModelFromMap(String str) =>
    FoodVendorModel.fromMap(json.decode(str));

String foodVendorModelToMap(FoodVendorModel data) => json.encode(data.toMap());

class FoodVendorModel {
  FoodVendorModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory FoodVendorModel.fromMap(Map<String, dynamic> json) => FoodVendorModel(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    this.id,
    this.email,
    this.phone,
    this.name,
    this.location,
    this.description,
    this.sliderImages,
    this.vendorFirstName,
    this.vendorLastName,
    this.vendorProfilePic,
    this.menuList,
    this.foodVendorItems,
  });

  String? id;
  String? email;
  String? phone;
  String? name;
  String? location;
  String? description;
  List<String>? sliderImages;
  String? vendorFirstName;
  String? vendorLastName;
  String? vendorProfilePic;
  List<MenuList>? menuList;
  List<FoodVendorItem>? foodVendorItems;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        email: json["email"],
        phone: json["phone"],
        name: json["name"],
        location: json["location"],
        description: json["description"],
        sliderImages: List<String>.from(json["slider_images"].map((x) => x)),
        vendorFirstName: json["vendor_first_name"],
        vendorLastName: json["vendor_last_name"],
        vendorProfilePic: json["vendor_profile_pic"],
        menuList: List<MenuList>.from(
            json["menu_list"].map((x) => MenuList.fromMap(x))),
        foodVendorItems: List<FoodVendorItem>.from(
            json["food_vendor_items"].map((x) => FoodVendorItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "phone": phone,
        "name": name,
        "location": location,
        "description": description,
        "slider_images": List<dynamic>.from(sliderImages!.map((x) => x)),
        "vendor_first_name": vendorFirstName,
        "vendor_last_name": vendorLastName,
        "vendor_profile_pic": vendorProfilePic,
        "menu_list": List<dynamic>.from(menuList!.map((x) => x.toMap())),
        "food_vendor_items":
            List<dynamic>.from(foodVendorItems!.map((x) => x.toMap())),
      };
}

class FoodVendorItem {
  FoodVendorItem({
    this.itemId,
    this.foodMenu,
    this.name,
    this.image,
    this.description,
  });

  String? itemId;
  String? foodMenu;
  String? name;
  String? image;
  String? description;

  factory FoodVendorItem.fromMap(Map<String, dynamic> json) => FoodVendorItem(
        itemId: json["item_id"],
        foodMenu: json["food-menu"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "item_id": itemId,
        "food-menu": foodMenu,
        "name": name,
        "image": image,
        "description": description,
      };
}

class MenuList {
  MenuList({
    this.menuId,
    this.menuName,
  });

  String? menuId;
  String? menuName;

  factory MenuList.fromMap(Map<String, dynamic> json) => MenuList(
        menuId: json["menu_id"],
        menuName: json["menu_name"],
      );

  Map<String, dynamic> toMap() => {
        "menu_id": menuId,
        "menu_name": menuName,
      };
}
