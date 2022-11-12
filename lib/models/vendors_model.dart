class Vendors {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Vendors({
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

  Vendors.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Data {
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
  List<FoodVendorItems>? foodVendorItems;

  Data({
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

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    name = json['name'];
    location = json['location'];
    description = json['description'];
    sliderImages = json['slider_images'].cast<String>();
    vendorFirstName = json['vendor_first_name'];
    vendorLastName = json['vendor_last_name'];
    vendorProfilePic = json['vendor_profile_pic'];
    if (json['menu_list'] != null) {
      menuList = <MenuList>[];
      json['menu_list'].forEach((v) {
        menuList!.add(MenuList.fromJson(v));
      });
    }
    if (json['food_vendor_items'] != null) {
      foodVendorItems = <FoodVendorItems>[];
      json['food_vendor_items'].forEach((v) {
        foodVendorItems!.add(FoodVendorItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['phone'] = phone;
    data['name'] = name;
    data['location'] = location;
    data['description'] = description;
    data['slider_images'] = sliderImages;
    data['vendor_first_name'] = vendorFirstName;
    data['vendor_last_name'] = vendorLastName;
    data['vendor_profile_pic'] = vendorProfilePic;
    if (menuList != null) {
      data['menu_list'] = menuList!.map((v) => v.toJson()).toList();
    }
    if (foodVendorItems != null) {
      data['food_vendor_items'] =
          foodVendorItems!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['menu_id'] = menuId;
    data['menu_name'] = menuName;
    return data;
  }
}

class FoodVendorItems {
  String? itemId;
  String? foodMenu;
  String? name;
  String? image;
  String? description;

  FoodVendorItems({
    this.itemId,
    this.foodMenu,
    this.name,
    this.image,
    this.description,
  });

  FoodVendorItems.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    foodMenu = json['food-menu'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['food-menu'] = foodMenu;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    return data;
  }
}
