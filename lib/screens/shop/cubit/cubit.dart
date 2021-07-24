import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/models/cart_model.dart';
import 'package:fresh_food/models/product.dart';
import 'package:fresh_food/screens/shop/cubit/states.dart';
import 'package:fresh_food/shared/network/remote/firebase.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopStateInitial());

  static ShopCubit get(context) => BlocProvider.of(context);

  List<Product> products = [];

  Map<String, CartItem> cartItems = {};

  double totalPrice = 0;

  getProducts() async {
    emit(ShopStateLoading());
    await FirebaseFirestore.instance
        .collection("products")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        var x = Product.fromData(doc);
        products.add(x);
        emit(ShopStateSuccess());
      });
    }).onError((error, stackTrace) {
      emit(ShopStateFailed());
      print(error.toString());
    });
  }

  addToCart(Product product) {
    emit(ShopStateCartLoading());

    if (cartItems.containsKey(product.id.toString())) {
      cartItems.update(
          product.id.toString(),
          (sameCartItem) => CartItem(
              id: sameCartItem.id.toString(),
              image: sameCartItem.image,
              price: double.parse(sameCartItem.price.toString()),
              quantity: sameCartItem.quantity + 1,
              name: sameCartItem.name.toString()));
    }

    cartItems.putIfAbsent(
        product.id.toString(),
        () => CartItem(
            id: product.id.toString(),
            quantity: 1,
            image: product.photoLink.toString(),
            price: double.parse(product.price.toString()),
            name: product.name.toString()));
    emit(ShopStateCartSuccess());
  }

  getCartTotalPrice() {
    emit(ShopStateLoading());
    cartItems.forEach((key, value) {
      totalPrice += value.price * value.quantity;
    });
    emit(ShopStateCartSuccess());
  }
}
