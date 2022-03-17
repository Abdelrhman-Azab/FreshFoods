import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/main_cubit/cubit.dart';
import 'package:fresh_food/screens/delivery_address/cubit/cubit.dart';
import 'package:fresh_food/screens/delivery_address/cubit/states.dart';
import 'package:fresh_food/screens/delivery_address/delivery_options.dart';
import 'package:fresh_food/screens/delivery_address/delivery_payment.dart';
import 'package:fresh_food/screens/delivery_address/delivery_summary.dart';
import 'package:fresh_food/screens/order/order_success_screen.dart';
import 'package:fresh_food/screens/shop/cubit/cubit.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/shared/style/myText.dart';
import 'package:fresh_food/shared/style/my_colors.dart';

class DeliveryAddress extends StatelessWidget {
  static const String id = "delivery";

  String x = "";

  @override
  Widget build(BuildContext context) {
    var deliveryCubit = DeliveryCubit.get(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<DeliveryCubit, DeliveryStates>(
          listener: (context, state) {
            if (state is DeliveryStateOrderSuccess) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  OrderSuccessScreen.id, (route) => false);
            }
          },
          builder: (context, state) => state is DeliveryStateOrderLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black12,
                                offset: Offset(0.7, 0.7)),
                          ],
                          color: MainCubit.get(context).dark
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    child: Icon(Icons.arrow_back),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      deliveryCubit.selectedIndex = 0;
                                    },
                                  ),
                                  Spacer(),
                                  Center(
                                    child: Text(
                                      deliveryCubit.selectedIndex == 0
                                          ? "Delivery Address"
                                          : deliveryCubit.selectedIndex == 1
                                              ? "Delivery Options"
                                              : deliveryCubit.selectedIndex == 2
                                                  ? "Payment Method"
                                                  : "Order Summary",
                                      style: bold20,
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    width: 15,
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 10, left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  deliveryTabContainer(
                                      size: size,
                                      containerColor:
                                          deliveryCubit.selectedIndex == 0
                                              ? greenColor
                                              : MainCubit.get(context).dark
                                                  ? Colors.grey[850]!
                                                  : Colors.white,
                                      imageColor:
                                          deliveryCubit.selectedIndex == 0
                                              ? Colors.white
                                              : Colors.grey,
                                      onTap: () {
                                        //    changeIndex(0);
                                      },
                                      imagePath: 'images/placeholder.png'),
                                  deliveryTabContainer(
                                      size: size,
                                      containerColor:
                                          deliveryCubit.selectedIndex == 1
                                              ? greenColor
                                              : MainCubit.get(context).dark
                                                  ? Colors.grey[850]!
                                                  : Colors.white,
                                      imageColor:
                                          deliveryCubit.selectedIndex == 1
                                              ? Colors.white
                                              : Colors.grey,
                                      onTap: () {
                                        //     changeIndex(1);
                                      },
                                      imagePath: 'images/truck.png'),
                                  deliveryTabContainer(
                                      size: size,
                                      containerColor:
                                          deliveryCubit.selectedIndex == 2
                                              ? greenColor
                                              : MainCubit.get(context).dark
                                                  ? Colors.grey[850]!
                                                  : Colors.white,
                                      imageColor:
                                          deliveryCubit.selectedIndex == 2
                                              ? Colors.white
                                              : Colors.grey,
                                      onTap: () {
                                        //       changeIndex(2);
                                      },
                                      imagePath: 'images/credit-card.png'),
                                  deliveryTabContainer(
                                      size: size,
                                      containerColor:
                                          deliveryCubit.selectedIndex == 3
                                              ? greenColor
                                              : MainCubit.get(context).dark
                                                  ? Colors.grey[850]!
                                                  : Colors.white,
                                      imageColor:
                                          deliveryCubit.selectedIndex == 3
                                              ? Colors.white
                                              : Colors.grey,
                                      onTap: () {
                                        //    changeIndex(3);
                                      },
                                      imagePath: 'images/menu.png'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    if (deliveryCubit.selectedIndex == 0)
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            width: double.infinity,
                            child: ListView(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                deliveryTextForm(
                                    controller: deliveryCubit.nameController,
                                    labelText: "Name"),
                                SizedBox(
                                  height: 20,
                                ),
                                deliveryTextForm(
                                    keyboardType: TextInputType.phone,
                                    controller: deliveryCubit.phoneController,
                                    labelText: "Phone"),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Country : Egypt",
                                  style: bold20,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: baseFormFillColor,
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5)),
                                  width: 100,
                                  child: DropdownButton<String>(
                                    hint: Text("Select your city"),
                                    value: deliveryCubit.dropdownValue,
                                    icon: const Icon(Icons.arrow_downward),
                                    iconSize: 24,
                                    elevation: 16,
                                    isExpanded: true,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                    underline: SizedBox(),
                                    onChanged: (value) {
                                      deliveryCubit.changeDropDownValue(value);
                                    },
                                    items: deliveryCubit.cites
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                deliveryTextForm(
                                    controller: deliveryCubit.cityController,
                                    labelText: "City"),
                                SizedBox(
                                  height: 20,
                                ),
                                deliveryTextForm(
                                    controller: deliveryCubit.streetController,
                                    labelText: "Street Number"),
                                SizedBox(
                                  height: 20,
                                ),
                                deliveryTextForm(
                                    controller:
                                        deliveryCubit.moreInfoController,
                                    labelText:
                                        "More Address information (optional)"),
                              ],
                            )),
                      ),
                    if (deliveryCubit.selectedIndex == 1)
                      deliveryOptions(size: size, context: context),
                    if (deliveryCubit.selectedIndex == 2)
                      deliveryPayment(context),
                    if (deliveryCubit.selectedIndex == 3)
                      deliverySummary(
                          size: size,
                          context: context,
                          cartItems: ShopCubit.get(context).cartItems),
                    if (deliveryCubit.selectedIndex == 3)
                      deliverySummaryTotal(context),
                    myElevatedButton(
                        function: () {
                          if (deliveryCubit.selectedIndex == 0) {
                            if (deliveryCubit.firstCheck(context))
                              deliveryCubit
                                  .changeIndex(deliveryCubit.selectedIndex + 1);
                            return;
                          }

                          deliveryCubit.selectedIndex != 3
                              ? deliveryCubit
                                  .changeIndex(deliveryCubit.selectedIndex + 1)
                              : deliveryCubit.placeOrder(context);
                        },
                        text: deliveryCubit.selectedIndex != 3
                            ? 'CONTINUE'
                            : "PLACE ORDER",
                        color: greenColor)
                  ],
                ),
        ),
      ),
    );
  }
}
