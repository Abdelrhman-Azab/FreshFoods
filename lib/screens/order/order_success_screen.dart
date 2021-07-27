import 'package:flutter/material.dart';
import 'package:fresh_food/screens/tab_bar/tab_bar_screen.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/style/myText.dart';

class OrderSuccessScreen extends StatelessWidget {
  static const id = "ordersuccess";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              "Your order has been place successfuly.",
              style: bold20,
            ),
            Spacer(),
            defaultElevatedButton(
                buttonText: "Home Page",
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      TabBarScreen.id, (route) => false);
                }),
          ],
        ),
      ),
    );
  }
}
