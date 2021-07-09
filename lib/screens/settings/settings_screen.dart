import 'package:flutter/material.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/style/myText.dart';
import 'package:fresh_food/style/my_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black12,
                        offset: Offset(0.7, 0.7))
                  ],
                  color: Colors.white,
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
          ),
          Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    settingsContainers(
                        text: 'Your Account',
                        icon: Icons.person_outline,
                        onTap: () {}),
                    settingsContainers(
                        text: 'Your Orders',
                        icon: Icons.library_books,
                        onTap: () {}),
                    settingsContainers(
                        text: 'Sign Out',
                        icon: Icons.exit_to_app_rounded,
                        onTap: () {}),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
