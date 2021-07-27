import 'package:http/http.dart';

class CartItem {
  String? name;
  String? id;
  int? quantity;
  String? image;
  double? price;

  CartItem(
      {required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.quantity});

  CartItem.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    id = map['id'];
    quantity = map['quantity'];
    price = map['price'];
    image = map['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "quantity": quantity,
      "id": id,
      'price': price
    };
  }
}
