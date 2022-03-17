import 'package:flutter/material.dart';
import 'package:fresh_food/models/cart_model.dart';
import 'package:fresh_food/screens/cart/cubit/cubit.dart';
import 'package:fresh_food/screens/delivery_address/cubit/cubit.dart';
import 'package:fresh_food/screens/shop/cubit/cubit.dart';
import 'package:fresh_food/shared/style/myText.dart';

deliverySummary(
        {required Size size,
        required BuildContext context,
        required Map<String, CartItem> cartItems}) =>
    Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 5,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        color: Theme.of(context).primaryColor,
                        height: 80,
                        width: size.width * 0.2,
                        child: Image.network(
                          cartItems.values.toList()[index].image ?? "",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        ),
                        height: 80,
                        child: Center(
                            child: Text(
                          cartItems.values.toList()[index].name ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: bold16,
                        )),
                        width: size.width * 0.25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        cartItems.values.toList()[index].quantity!.toString(),
                        style: bold16,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "kg",
                        style: bold16,
                      ),
                      Spacer(),
                      Container(
                        width: 70,
                        child: Text(
                          "${cartItems.values.toList()[index].price! * cartItems.values.toList()[index].quantity!.toDouble()} LE",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: bold16,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: cartItems.length,
        ),
      ),
    );

deliverySummaryTotal(BuildContext context) => Padding(
      padding: EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sub-Total",
                style: bold20,
              ),
              Text(
                "${ShopCubit.get(context).totalPrice} LE",
                style: bold20,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery",
                style: bold20,
              ),
              Text(
                DeliveryCubit.get(context).selectedDeliveryIndex == 0
                    ? "Free"
                    : "40 LE",
                style: bold20,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: bold20,
              ),
              Text(
                DeliveryCubit.get(context).selectedDeliveryIndex == 0
                    ? "${ShopCubit.get(context).totalPrice} LE"
                    : "${ShopCubit.get(context).totalPrice + 40} LE",
                style: bold20,
              )
            ],
          ),
        ],
      ),
    );
