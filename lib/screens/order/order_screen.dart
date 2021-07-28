import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/cubit/cubit.dart';
import 'package:fresh_food/screens/order/cubit/cubit.dart';
import 'package:fresh_food/screens/order/cubit/states.dart';
import 'package:fresh_food/style/myText.dart';
import 'package:fresh_food/style/my_colors.dart';

class OrderScreen extends StatelessWidget {
  static const id = "orders";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<OrderCubit, OrderStates>(
          listener: (context, state) {},
          builder: (context, state) => Container(
              child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black12,
                          offset: Offset(0.7, 0.7))
                    ],
                    color: MainCubit.get(context).dark
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child: Icon(Icons.arrow_back),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Spacer(),
                      Center(
                        child: Text(
                          "Your Orders",
                          style: bold20,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: baseFormFillColor,
                            borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.all(20),
                        width: double.infinity,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Order ${index + 1}",
                                    style: bold20,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        OrderCubit.get(context).changeExpanded(
                                            OrderCubit.get(context)
                                                .orders[index]);
                                      },
                                      icon: OrderCubit.get(context)
                                              .orders[index]
                                              .expanded
                                          ? Icon(Icons.arrow_drop_up)
                                          : Icon(Icons.arrow_drop_down))
                                ],
                              ),
                              if (OrderCubit.get(context)
                                  .orders[index]
                                  .expanded)
                                SizedBox(
                                  height: 20,
                                ),
                              if (OrderCubit.get(context)
                                  .orders[index]
                                  .expanded)
                                ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 5,
                                    );
                                  },
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemBuilder: (context, secondIndex) {
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        children: [
                                          Text(
                                            OrderCubit.get(context)
                                                .orders[index]
                                                .products![secondIndex]["name"],
                                            style: bold16,
                                          ),
                                          Spacer(),
                                          Text(
                                            OrderCubit.get(context)
                                                .orders[index]
                                                .products![secondIndex]
                                                    ["quantity"]
                                                .toString(),
                                            style: bold16,
                                          ),
                                          Text(
                                            "kg",
                                            style: bold16,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            OrderCubit.get(context)
                                                .orders[index]
                                                .products![secondIndex]["price"]
                                                .toString(),
                                            style: bold16,
                                          ),
                                          Text(
                                            "LE",
                                            style: bold16,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  itemCount: OrderCubit.get(context)
                                      .orders[index]
                                      .products!
                                      .length,
                                ),
                              if (OrderCubit.get(context)
                                  .orders[index]
                                  .expanded)
                                SizedBox(
                                  height: 20,
                                ),
                              if (OrderCubit.get(context)
                                  .orders[index]
                                  .expanded)
                                Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Delivery",
                                          style: bold18,
                                        ),
                                        OrderCubit.get(context)
                                                    .orders[index]
                                                    .deliverytype
                                                    .toString() ==
                                                "Standard"
                                            ? Text(
                                                "FREE",
                                                style: bold18,
                                              )
                                            : Text(
                                                "40 LE",
                                                style: bold18,
                                              ),
                                      ],
                                    )),
                              if (OrderCubit.get(context)
                                  .orders[index]
                                  .expanded)
                                SizedBox(
                                  height: 5,
                                ),
                              if (OrderCubit.get(context)
                                  .orders[index]
                                  .expanded)
                                Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total",
                                          style: bold18,
                                        ),
                                        OrderCubit.get(context)
                                                    .orders[index]
                                                    .deliverytype
                                                    .toString() ==
                                                "Standard"
                                            ? Text(
                                                "${OrderCubit.get(context).orders[index].totalPrice.toString()} LE",
                                                style: bold18,
                                              )
                                            : Text(
                                                "${OrderCubit.get(context).orders[index].totalPrice! + 40} LE",
                                                style: bold18,
                                              ),
                                      ],
                                    ))
                            ]),
                      );
                    },
                    itemCount: OrderCubit.get(context).orders.length,
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
