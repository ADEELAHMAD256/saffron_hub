class VendorsItemList {
  String vendorsItemText;
  String vendorsItemImage;
  String? vendorsAddress;
  String? vendorsPhoneNumber;

  VendorsItemList(
      {required this.vendorsItemText,
      required this.vendorsItemImage,
      this.vendorsAddress,
      this.vendorsPhoneNumber});
}

List<VendorsItemList> vendorsItemList = [
  VendorsItemList(
    vendorsItemText: "Kitchen Logic",
    vendorsItemImage: "assets/images/vendors_images.png",
    vendorsAddress: "Faisalabad",
    vendorsPhoneNumber: "03001234567",
  ),
  VendorsItemList(
    vendorsItemText: "Kitchen Logic",
    vendorsItemImage: "assets/images/vendors_images.png",
    vendorsAddress: "Faisalabad",
    vendorsPhoneNumber: "03001234567",
  ),
  VendorsItemList(
    vendorsItemText: "Kitchen Logic",
    vendorsItemImage: "assets/images/vendors_images.png",
    vendorsAddress: "Faisalabad",
    vendorsPhoneNumber: "03001234567",
  ),
  VendorsItemList(
    vendorsItemText: "Kitchen Logic",
    vendorsItemImage: "assets/images/vendors_images.png",
    vendorsAddress: "Faisalabad",
    vendorsPhoneNumber: "03001234567",
  ),
];
