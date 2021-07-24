import 'package:http/http.dart';

class CartItem {
  String name;
  String id;
  int quantity;
  bool opened;
  String image;
  double price;

  CartItem(
      {required this.id,
      required this.image,
      required this.name,
      required this.price,
      this.opened = false,
      required this.quantity});
}
