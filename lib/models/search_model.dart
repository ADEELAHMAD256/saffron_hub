// To parse this JSON data, do
//
//     final postModel = postModelFromMap(jsonString);

import 'dart:convert';

List<PostModel> postModelFromMap(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromMap(x)));

String postModelToMap(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PostModel {
  PostModel({
    this.vendorFirstName,
    this.vendorLastName,
    this.vendorProfilePic,
    this.name,
    this.email,
    this.phone,
    this.location,
    this.logo,
    this.sliderImages,
    this.description,
    this.menuList,
    this.foodVendorItems,
  });

  String? vendorFirstName;
  String? vendorLastName;
  String? vendorProfilePic;
  String? name;
  String? email;
  String? phone;
  String? location;
  String? logo;
  List<String>? sliderImages;
  String? description;
  List<MenuList>? menuList;
  List<FoodVendorItem>? foodVendorItems;

  factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
        vendorFirstName: json["vendor_first_name"],
        vendorLastName: json["vendor_last_name"],
        vendorProfilePic: json["vendor_profile_pic"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        location: json["location"],
        logo: json["logo"],
        sliderImages: List<String>.from(json["slider_images"].map((x) => x)),
        description: json["description"],
        menuList: List<MenuList>.from(
            json["menu_list"].map((x) => MenuList.fromMap(x))),
        foodVendorItems: List<FoodVendorItem>.from(
            json["food_vendor_items"].map((x) => FoodVendorItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "vendor_first_name": vendorFirstName,
        "vendor_last_name": vendorLastName,
        "vendor_profile_pic": vendorProfilePic,
        "name": name,
        "email": email,
        "phone": phone,
        "location": location,
        "logo": logo,
        "slider_images": List<dynamic>.from(sliderImages!.map((x) => x)),
        "description": description,
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
