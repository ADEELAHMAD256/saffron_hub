class RestaurantsListModel {
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
  List<MenuList>? menuList = [];
  List<FoodVendorItems>? foodVendorItems;

  RestaurantsListModel(
      {this.vendorFirstName,
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
      this.foodVendorItems});

  RestaurantsListModel.fromJson(Map<String, dynamic> json) {
    vendorFirstName = json['vendor_first_name'];
    vendorLastName = json['vendor_last_name'];
    vendorProfilePic = json['vendor_profile_pic'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    location = json['location'];
    logo = json['logo'];
    sliderImages = json['slider_images'].cast<String>();
    description = json['description'];
    if (json['menu_list'] != null) {
      menuList = <MenuList>[];
      json['menu_list'].forEach((v) {
        menuList!.add(new MenuList.fromJson(v));
      });
    }
    if (json['food_vendor_items'] != null) {
      foodVendorItems = <FoodVendorItems>[];
      json['food_vendor_items'].forEach((v) {
        foodVendorItems!.add(new FoodVendorItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendor_first_name'] = this.vendorFirstName;
    data['vendor_last_name'] = this.vendorLastName;
    data['vendor_profile_pic'] = this.vendorProfilePic;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['location'] = this.location;
    data['logo'] = this.logo;
    data['slider_images'] = this.sliderImages;
    data['description'] = this.description;
    if (this.menuList != null) {
      data['menu_list'] = this.menuList!.map((v) => v.toJson()).toList();
    }
    if (this.foodVendorItems != null) {
      data['food_vendor_items'] =
          this.foodVendorItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MenuList {
  String? menuId;
  String? menuName;

  MenuList({this.menuId, this.menuName});

  MenuList.fromJson(Map<String, dynamic> json) {
    menuId = json['menu_id'];
    menuName = json['menu_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu_id'] = this.menuId;
    data['menu_name'] = this.menuName;
    return data;
  }
}

class FoodVendorItems {
  String? itemId;
  String? foodMenu;
  String? name;
  String? image;
  String? description;

  FoodVendorItems(
      {this.itemId, this.foodMenu, this.name, this.image, this.description});

  FoodVendorItems.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    foodMenu = json['food-menu'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['food-menu'] = this.foodMenu;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}
