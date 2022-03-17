import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fresh_food/screens/delivery_address/cubit/cubit.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/shared/style/myText.dart';
import 'package:fresh_food/shared/style/my_colors.dart';

deliveryPayment(BuildContext context) => Expanded(
        child: Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              DeliveryCubit.get(context).changePaymentIndex(0);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              height: 60,
              color: baseFormFillColor,
              child: Row(
                children: [
                  DeliveryCubit.get(context).selectedPaymentMethod == 0
                      ? CircleAvatar(
                          radius: 15,
                          child: Image.asset("images/checked.png"),
                        )
                      : CircleAvatar(
                          backgroundColor: baseFormTextColor,
                          radius: 15,
                        ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Cash On Delivery",
                    style: bold18,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              DeliveryCubit.get(context).changePaymentIndex(1);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              height: 60,
              color: baseFormFillColor,
              child: Row(
                children: [
                  DeliveryCubit.get(context).selectedPaymentMethod == 1
                      ? CircleAvatar(
                          radius: 15,
                          child: Image.asset("images/checked.png"),
                        )
                      : CircleAvatar(
                          backgroundColor: baseFormTextColor,
                          radius: 15,
                        ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Credit Card",
                    style: bold18,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          if (DeliveryCubit.get(context).selectedPaymentMethod == 1)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                deliveryTextForm(
                    labelText: "Cardholder Name",
                    controller:
                        DeliveryCubit.get(context).cardHolderNameController),
                SizedBox(
                  height: 20,
                ),
                deliveryTextForm(
                    maxLength: 16,
                    labelText: "Card Number",
                    keyboardType: TextInputType.number,
                    controller:
                        DeliveryCubit.get(context).cardNumberController),
                SizedBox(
                  height: 20,
                ),
                deliveryTextForm(
                    maxLength: 5,
                    keyboardType: TextInputType.datetime,
                    labelText: "MM / YY",
                    controller:
                        DeliveryCubit.get(context).cardExpiryDateController),
                SizedBox(
                  height: 20,
                ),
                deliveryTextForm(
                    maxLength: 3,
                    labelText: "CVV",
                    controller:
                        DeliveryCubit.get(context).cardSecurityCodeController),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
        ],
      ),
    ));
