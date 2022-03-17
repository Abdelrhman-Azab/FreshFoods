import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/screens/introduction/introduction_screen.dart';
import 'package:fresh_food/screens/signup/cubit/cubit.dart';
import 'package:fresh_food/screens/signup/cubit/states.dart';
import 'package:fresh_food/screens/tab_bar/tab_bar_screen.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/shared/network/remote/firebase.dart';
import 'package:fresh_food/shared/style/my_colors.dart';

class SignUpScreen extends StatelessWidget {
  static const String id = "signup";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterStateLoading) {
            loading = true;
          }
          if (state is RegisterStateFailed) {
            loading = false;
          }
          if (state is RegisterStateSuccess) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                IntroductionScreen.id, (route) => false);
          }
        },
        builder: (context, state) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: size.height * 0.88,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
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
                        context: context,
                        controller: nameController,
                        imagePath: "images/icon-user.png",
                        hintText: "Full Name"),
                    SizedBox(
                      height: 12,
                    ),
                    defaultTextForm(
                        context: context,
                        controller: emailController,
                        keyboard: TextInputType.emailAddress,
                        imagePath: "images/icon-user.png",
                        hintText: "Email"),
                    SizedBox(
                      height: 12,
                    ),
                    defaultTextForm(
                        context: context,
                        controller: passwordController,
                        password: true,
                        imagePath: "images/icon-padlock.png",
                        hintText: "Password"),
                    Expanded(
                      child: SizedBox(),
                    ),
                    loading
                        ? CircularProgressIndicator()
                        : defaultElevatedButton(
                            buttonText: "CREATE ACCOUNT",
                            onPressed: () {
                              if (!emailController.text.contains("@")) {
                                showSnackBar(
                                    context: context,
                                    message:
                                        "Please enter a valid email address");
                                return;
                              }
                              if (passwordController.text.length < 6) {
                                showSnackBar(
                                    context: context,
                                    message: "Please enter a valid password");
                                return;
                              }
                              if (nameController.text.length < 3) {
                                showSnackBar(
                                    context: context,
                                    message: "Please enter your name");
                                return;
                              }
                              RegisterCubit.get(context).register(
                                  context: context,
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text);
                            }),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                  ],
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
        ),
      ),
    );
  }
}
