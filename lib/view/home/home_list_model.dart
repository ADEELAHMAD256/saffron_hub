class HomeItemList {
  String itemText;
  String itemImage;
  String? address;
  String? phoneNumber;

  HomeItemList(
      {required this.itemText,
      required this.itemImage,
      this.address,
      this.phoneNumber});
}

List<HomeItemList> homeItemList = [
  HomeItemList(
    itemText: "Kitchen Logic",
    itemImage: "assets/images/k1.png",
    address: "Faisalabad",
    phoneNumber: "03001234567",
  ),
  HomeItemList(
    itemText: "Kitchen Logic",
    itemImage: "assets/images/k1.png",
    address: "Faisalabad",
    phoneNumber: "03001234567",
  ),
  HomeItemList(
    itemText: "Kitchen Logic",
    itemImage: "assets/images/k1.png",
    address: "Faisalabad",
    phoneNumber: "03001234567",
  ),
  HomeItemList(
    itemText: "Kitchen Logic",
    itemImage: "assets/images/k1.png",
    address: "Faisalabad",
    phoneNumber: "03001234567",
  ),
  HomeItemList(
    itemText: "Kitchen Logic",
    itemImage: "assets/images/k1.png",
    address: "Faisalabad",
    phoneNumber: "03001234567",
  ),
];
