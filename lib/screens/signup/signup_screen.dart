import 'package:flutter/material.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/style/my_colors.dart';

import '../onboarding.dart';

class SignUpScreen extends StatelessWidget {
  static const String id = "signup";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.close))),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "Create Account",
                    style: TextStyle(color: baseTextColor, fontSize: 25),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  defaultTextForm(
                      imagePath: "images/icon-user.png", hintText: "Full Name"),
                  SizedBox(
                    height: 12,
                  ),
                  defaultTextForm(
                      imagePath: "images/icon-user.png", hintText: "Email"),
                  SizedBox(
                    height: 12,
                  ),
                  defaultTextForm(
                      imagePath: "images/icon-padlock.png",
                      hintText: "Password"),
                  Expanded(
                    child: SizedBox(),
                  ),
                  defaultElevatedButton(
                      buttonText: "CREATE ACCOUNT",
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            OnBoardingScreen.id, (route) => false);
                      }),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "SIGN IN",
              style: TextStyle(
                  color: baseFormTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
        ],
      ),
    );
  }
}
