import 'package:flutter/material.dart';
import 'package:fresh_food/main_cubit/cubit.dart';
import 'package:fresh_food/shared/style/myText.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              child: Text(
                "My Account",
                style: bold20,
              ),
            ),
          ),
          Expanded(
              child: Column(
            children: [Text('Email')],
          ))
        ],
      )),
    );
  }
}
