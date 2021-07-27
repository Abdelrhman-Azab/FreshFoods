import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/cubit/cubit.dart';
import 'package:fresh_food/screens/login/login_screen.dart';
import 'package:fresh_food/screens/settings/cubit/cubit.dart';
import 'package:fresh_food/screens/settings/cubit/states.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/style/myText.dart';
import 'package:fresh_food/style/my_colors.dart';

class SettingsScreen extends StatefulWidget {
  static const id = "settings";

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

bool lights = false;

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsStates>(
      listener: (context, state) {
        if (state is SettingsStateLogoutSuccess) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
        }
      },
      builder: (context, state) => SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  "Settings",
                  style: bold20,
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      settingsContainers(
                          context: context,
                          text: 'Your Account',
                          icon: Icons.person_outline,
                          onTap: () {}),
                      settingsContainers(
                          context: context,
                          text: 'Your Orders',
                          icon: Icons.library_books,
                          onTap: () {}),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor),
                        width: double.infinity,
                        height: 60,
                        child: Row(
                          children: [
                            Icon(
                              Icons.brightness_4,
                              color: Colors.green,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                'Dark Mode',
                                style: bold16,
                              ),
                            ),
                            CupertinoSwitch(
                                value: MainCubit.get(context).dark,
                                onChanged: (value) {
                                  MainCubit.get(context).changeTheme();
                                })
                          ],
                        ),
                      ),
                      settingsContainers(
                          context: context,
                          text: 'Sign Out',
                          icon: Icons.exit_to_app_rounded,
                          onTap: () {
                            SettingsCubit.get(context).logOut();
                          }),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
