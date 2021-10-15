// // ignore_for_file: file_names

// class Shoes {
//   Shoes({required this.data});
//   Data data;

//   factory Shoes.fromJson(Map<String, dynamic> json) =>
//       Shoes(data: Data.fromJson(json["data"]));

//   Map<String, dynamic> tojson() => {
//         "data": data.toJson(),
//       };
// }

// class Data {
//   Data({
//     required this.productName,
//     required this.id,
//     required this.price,
//     required this.imageUrl,
//     required this.off,
//     required this.description,
//   });

//   String productName;
//   int id;
//   String price;
//   String imageUrl;
//   bool off;
//   String description;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         productName: json["product_name"],
//         id: json["id"],
//         price: json["price"],
//         imageUrl: json["image_url"],
//         off: json["off"],
//         description: json["description"],
//       );

//   Map<String, dynamic> toJson() => {
//         "product_name": productName,
//         "id": id,
//         "price": price,
//         "image_url": imageUrl,
//         "off": off,
//         "description": description,
//       };
// }

// To parse this JSON data, do
//
//     final shoes = shoesFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<Shoes> shoesFromJson(String str) =>
    List<Shoes>.from(json.decode(str).map((x) => Shoes.fromJson(x)));

String shoesToJson(List<Shoes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Shoes {
  Shoes({
    required this.productName,
    required this.id,
    required this.price,
    required this.imageUrl,
    required this.off,
    required this.description,
  });

  String productName;
  int id;
  String price;
  String imageUrl;
  bool off;
  String description;

  factory Shoes.fromJson(Map<String, dynamic> json) => Shoes(
        productName: json["product_name"],
        id: json["id"],
        price: json["price"],
        imageUrl: json["image_url"],
        off: json["off"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "id": id,
        "price": price,
        "image_url": imageUrl,
        "off": off,
        "description": description,
      };
}
