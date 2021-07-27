import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/screens/login/cubit/cubit.dart';
import 'package:fresh_food/screens/login/cubit/states.dart';
import 'package:fresh_food/screens/signup/cubit/states.dart';
import 'package:fresh_food/screens/signup/signup_screen.dart';
import 'package:fresh_food/screens/tab_bar/tab_bar_screen.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/style/my_colors.dart';

class LoginScreen extends StatelessWidget {
  static const id = "login";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginStateLoading) {
          loading = true;
        }
        if (state is LoginStateFailed) {
          loading = false;
        }
        if (state is LoginStateSuccess) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(TabBarScreen.id, (route) => false);
        }
      },
      builder: (context, state) => SingleChildScrollView(
        child: Column(
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
                      context: context,
                      controller: emailController,
                      imagePath: "images/icon-user.png",
                      keyboard: TextInputType.emailAddress,
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
                  loading
                      ? CircularProgressIndicator()
                      : defaultElevatedButton(
                          buttonText: "SIGN IN",
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
                            LoginCubit.get(context).login(
                                context: context,
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
      ),
    ));
  }
}
