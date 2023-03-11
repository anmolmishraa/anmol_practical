class CartModel {
  CartModel({
      this.subProductId, 
      this.productId, 
      this.cartId, 
      this.productImage, 
      this.productName, 
      this.subProductName, 
      this.quantity, 
      this.price, 
      this.productSalePrice, 
      this.bulkQty, 
      this.size, 
      this.colors,});

  CartModel.fromJson(dynamic json) {
    subProductId = json['sub_product_id'];
    productId = json['product_id'];
    cartId = json['cart_id'];
    productImage = json['product_image'];
    productName = json['product_name'];
    subProductName = json['sub_product_name'];
    quantity = json['quantity'];
    price = json['price'];
    productSalePrice = json['product_sale_price'];
    bulkQty = json['bulk_qty'];
    size = json['size'];
    colors = json['colors'];
  }
  String? subProductId;
  String? productId;
  String? cartId;
  String? productImage;
  String? productName;
  String? subProductName;
  String? quantity;
  String? price;
  String? productSalePrice;
  String? bulkQty;
  String? size;
  String? colors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sub_product_id'] = subProductId;
    map['product_id'] = productId;
    map['cart_id'] = cartId;
    map['product_image'] = productImage;
    map['product_name'] = productName;
    map['sub_product_name'] = subProductName;
    map['quantity'] = quantity;
    map['price'] = price;
    map['product_sale_price'] = productSalePrice;
    map['bulk_qty'] = bulkQty;
    map['size'] = size;
    map['colors'] = colors;
    return map;
  }

}