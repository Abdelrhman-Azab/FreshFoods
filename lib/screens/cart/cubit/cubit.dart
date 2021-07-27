import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/models/cart_model.dart';
import 'package:fresh_food/screens/cart/cart_screen.dart';
import 'package:fresh_food/screens/cart/cubit/states.dart';
import 'package:fresh_food/screens/shop/cubit/cubit.dart';
import 'package:fresh_food/shared/network/remote/firebase.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartStateInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  String dropdownValue = '1';

  List<String> cites = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];

  getCartFromFireStore(BuildContext context) {
    emit(CartStateLoading());
    FirebaseFirestore.instance.collection("users").doc(uid).get().then((value) {
      Map<String, dynamic> data = value.data() as Map<String, dynamic>;
      List<dynamic> cart = data['cart'] as List<dynamic>;
      cart.forEach((element) {
        ShopCubit.get(context).cartItems.putIfAbsent(
            element["id"].toString(),
            () => CartItem(
                id: element["id"].toString(),
                image: element["image"].toString(),
                name: element["name"].toString(),
                price: element["price"].toDouble(),
                quantity: element["quantity"].toInt()));
      });
    }).then((value) {
      ShopCubit.get(context).getCartTotalPrice();
      emit(CartStateSuccess());
    }).onError((error, stackTrace) {
      emit(CartStateFailed());
    });
  }

  deleteFromCart(CartItem cartItem, BuildContext context) {
    emit(CartStateLoading());
    FirebaseFirestore.instance.collection("users").doc(uid).update({
      "cart": FieldValue.arrayRemove([cartItem.toJson()])
    }).then((value) {
      ShopCubit.get(context).cartItems.remove(cartItem.id);
      ShopCubit.get(context).getCartTotalPrice();
      emit(CartStateSuccess());
    });
  }

  changeQuantity(CartItem cartItem, BuildContext context, double quantity) {
    emit(CartStateLoading());
    FirebaseFirestore.instance.collection("users").doc(uid).update({
      "cart": FieldValue.arrayRemove([cartItem.toJson()])
    }).then((value) {
      FirebaseFirestore.instance.collection("users").doc(uid).update({
        "cart": FieldValue.arrayUnion([
          {
            "id": cartItem.id,
            "name": cartItem.name,
            "quantity": quantity,
            "price": cartItem.price,
            "image": cartItem.image
          }
        ])
      }).onError((error, stackTrace) {
        print(error);
      });
      ShopCubit.get(context).cartItems[cartItem.id]!.quantity =
          quantity.toInt();
      ShopCubit.get(context).getCartTotalPrice();
      emit(CartStateSuccess());
    });
  }
}
