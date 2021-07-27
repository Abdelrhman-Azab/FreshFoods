import 'package:flutter/material.dart';
import 'package:fresh_food/screens/delivery_address/cubit/cubit.dart';
import 'package:fresh_food/style/myText.dart';
import 'package:fresh_food/style/my_colors.dart';

deliveryOptions({
  required Size size,
  required BuildContext context,
}) =>
    Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Select Speed",
                style: bold20,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: baseFormFillColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 180,
                    width: size.width * 0.4,
                    child: Column(
                      children: [
                        Image.asset(
                          'images/truck.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Standard",
                          style: bold18,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "3-4 days (free)",
                          style:
                              TextStyle(fontSize: 18, color: baseFormTextColor),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            DeliveryCubit.get(context).changeDeliveryIndex(0);
                          },
                          child: DeliveryCubit.get(context)
                                      .selectedDeliveryIndex ==
                                  0
                              ? CircleAvatar(
                                  radius: 15,
                                  child: Image.asset("images/checked.png"),
                                )
                              : CircleAvatar(
                                  backgroundColor: baseFormTextColor,
                                  radius: 15,
                                ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: baseFormFillColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 180,
                    width: size.width * 0.4,
                    child: Column(
                      children: [
                        Image.asset(
                          'images/delivery-truck.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Fast delivery",
                          style: bold18,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Next day (40 LE)",
                          style:
                              TextStyle(fontSize: 18, color: baseFormTextColor),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            DeliveryCubit.get(context).changeDeliveryIndex(1);
                          },
                          child: DeliveryCubit.get(context)
                                      .selectedDeliveryIndex ==
                                  1
                              ? CircleAvatar(
                                  radius: 15,
                                  child: Image.asset("images/checked.png"),
                                )
                              : CircleAvatar(
                                  backgroundColor: baseFormTextColor,
                                  radius: 15,
                                ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
