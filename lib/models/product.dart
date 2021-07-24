import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';

class Product {
  String? id;
  String? name;
  String? category;
  String? price;
  String? photoLink;
  Map? nutrition;
  String? description;

  Product.fromData(QueryDocumentSnapshot snapshot) {
    id = snapshot['id'];
    name = snapshot['name'];
    category = snapshot['category'];
    price = snapshot['price'];
    photoLink = snapshot['photo'];
    nutrition = snapshot['nutrition'];
    description = snapshot['description'];
  }
}
