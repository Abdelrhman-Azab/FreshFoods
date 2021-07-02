import 'package:flutter/material.dart';
import 'package:fresh_food/screens/login/login_screen.dart';
import 'package:fresh_food/screens/onboarding.dart';
import 'package:fresh_food/screens/signup/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: LoginScreen(),
      routes: {
        SignUpScreen.id: (context) => SignUpScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        OnBoardingScreen.id: (context) => OnBoardingScreen(),
      },
    );
  }
}
