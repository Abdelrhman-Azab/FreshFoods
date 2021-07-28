import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/models/order_model.dart';
import 'package:fresh_food/screens/order/cubit/states.dart';
import 'package:fresh_food/shared/network/remote/firebase.dart';

class OrderCubit extends Cubit<OrderStates> {
  OrderCubit() : super(OrderStateInitial());

  static OrderCubit get(context) => BlocProvider.of(context);

  List<Order> orders = [];

  changeExpanded(Order order) {
    order.expanded = !order.expanded;
    emit(OrderStateExpanded());
  }

  getOrders() {
    orders.clear();
    emit(OrderStateLoading());
    FirebaseFirestore.instance
        .collection("orders")
        .doc(uid)
        .get()
        .then((documentSnapshot) {
      List<dynamic> ordersMap = documentSnapshot['orders'];
      ordersMap.forEach((map) {
        orders.add(Order.fromMap(map));
      });
      emit(OrderStateSuccess());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(OrderStateFailed());
    });
  }
}
