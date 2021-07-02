import 'package:flutter/material.dart';
import 'package:fresh_food/screens/signup/signup_screen.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/style/my_colors.dart';

class LoginScreen extends StatelessWidget {
  static const id = "login";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
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
                    height: size.height * 0.15,
                  ),
                  Text(
                    "Sign In",
                    style: TextStyle(color: baseTextColor, fontSize: 25),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  defaultTextForm(
                      imagePath: "images/icon-user.png", hintText: "Email"),
                  SizedBox(
                    height: 12,
                  ),
                  defaultTextForm(
                      imagePath: "images/icon-padlock.png",
                      hintText: "Password"),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: baseFormTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  defaultElevatedButton(
                      buttonText: "SIGN IN", onPressed: () {}),
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
              Navigator.of(context).push(createRoute(SignUpScreen()));
            },
            child: Text(
              "CREATE ACCOUNT",
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
