import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/models/cart_model.dart';
import 'package:fresh_food/models/product.dart';
import 'package:fresh_food/screens/shop/cubit/states.dart';
import 'package:fresh_food/shared/components/components.dart';
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

  addToCart(Product product, BuildContext context) {
    bool found = false;
    var index = 0;

    emit(ShopStateCartLoading());

    FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      List cart = data['cart'];
      for (int i = 0; i < cart.length; i++) {
        if (cart[i]["id"] == product.id) {
          showSnackBar(context: context, message: "Item already in the cart");
          found = true;
          index = i;
        }
      }
      if (found == false)
        FirebaseFirestore.instance.collection("users").doc(uid).update({
          "cart": FieldValue.arrayUnion([
            {
              "id": product.id.toString(),
              "image": product.photoLink.toString(),
              "quantity": 1,
              "price": double.parse(product.price.toString()),
              "name": product.name.toString()
            }
          ])
        }).then((value) {
          showSnackBar(
              context: context, message: "Item added to the cart successfully");
        }).onError((error, stackTrace) {
          showSnackBar(context: context, message: "There is an error");
        });
    });

    //     FirebaseFirestore.instance
    //     .collection("users")
    //     .doc(uid)
    //     .get()
    //     .then((DocumentSnapshot documentSnapshot) {
    //   Map<String, dynamic> data =
    //       documentSnapshot.data() as Map<String, dynamic>;
    //   List cart = data['cart'];
    //   for (int i = 0; i < cart.length; i++) {
    //     if (cart[i]["id"] == product.id) {
    //       FirebaseFirestore.instance.collection("users").doc(uid).update({
    //         "cart": FieldValue.arrayRemove([cart[i]])
    //       });
    //      FirebaseFirestore.instance.collection("users").doc(uid).update({
    //   "cart": FieldValue.arrayUnion([
    //     {
    //       "id": product.id.toString(),
    //       "image": product.photoLink.toString(),
    //       "quantity": cart[i]['quantity'] + 1,
    //       "price": double.parse(product.price.toString()),
    //       "name": product.name.toString()
    //     }
    //   ])
    // });
    //     }
    //   }
    // });
    emit(ShopStateCartSuccess());
  }

  getCartTotalPrice() {
    totalPrice = 0;
    emit(ShopStateLoading());
    cartItems.forEach((key, value) {
      totalPrice += value.price! * value.quantity!;
    });
    emit(ShopStateCartSuccess());
  }
}
