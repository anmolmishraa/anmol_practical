import 'cart_model.dart';

class CartResponseWrapper {
  CartResponseWrapper({
    this.responseCode,
    this.message,
    this.cartData,
    this.subtotal,
    this.tax,
    this.totalItems,
    this.status,
  });


  CartResponseWrapper.fromJson(dynamic json) {
    responseCode = json['response_code'];
    message = json['message'];
    if (json['cart'] != null) {
      cartData = [];
      json['cart'].forEach((v) {
        cartData?.add(CartModel.fromJson(v));
      });
    }
    subtotal = json['subtotal'];
    tax = json['tax'];
    totalItems = json['total_items'];
    status = json['status'];
  }
  String? responseCode;
  String? message;
  List<CartModel>? cartData;
  String? subtotal;
  String? tax;
  String? totalItems;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response_code'] = responseCode;
    map['message'] = message;
    if (cartData != null) {
      map['cart'] = cartData?.map((v) => v.toJson()).toList();
    }
    map['subtotal'] = subtotal;
    map['tax'] = tax;
    map['total_items'] = totalItems;
    map['status'] = status;
    return map;
  }
}
