import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  String? name;
  String? governorate;
  String? city;
  String? street;
  String? moreInfos;
  String? phone;
  String? deliverytype;
  String? email;
  String? payment;
  double? totalPrice;
  Timestamp? date;
  List? products;
  bool expanded = false;

  Order.fromMap(Map map) {
    name = map['name'];
    payment = map["payment"];
    city = map['city'];
    street = map['street'];
    deliverytype = map["deliverytype"];
    governorate = map["governorate"];
    moreInfos = map["moreInfos"];
    date = map["date"];
    totalPrice = map["totalPrice"];
    email = map["email"];
    products = map["products"];
    phone = map["phone"];
  }
}
