// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
  });

  int productId;
  String productName;
  int quantity;
  int price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["productId"],
    productName: json["productName"],
    quantity: json["quantity"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "productName": productName,
    "quantity": quantity,
    "price": price,
  };
}
