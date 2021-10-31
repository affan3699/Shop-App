class CartModel {
  String itemName, itemPrice, ItemImageURL;
  int itemQuantity;

  CartModel(
      {required this.itemName,
      required this.itemPrice,
      required this.ItemImageURL,
      required this.itemQuantity});

  factory CartModel.fromMap(Map item) {
    return CartModel(
        itemName: item["itemName"],
        itemPrice: item["itemPrice"],
        ItemImageURL: item["ItemImageURL"],
        itemQuantity: item["itemQuantity"]);
  }
}
