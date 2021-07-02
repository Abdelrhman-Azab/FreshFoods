import 'package:flutter/material.dart';
import 'package:fresh_food/style/my_colors.dart';

Widget defaultElevatedButton(
        {required String buttonText,
        required onPressed,
        IconData iconData = Icons.arrow_forward}) =>
    Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: baseTextColor, shape: StadiumBorder()),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 14,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                buttonText,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );

Widget defaultTextForm({required String imagePath, required String hintText}) =>
    Container(
        height: 60,
        decoration: BoxDecoration(
            color: baseFormFillColor, borderRadius: BorderRadius.circular(6)),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              color: baseFormTextColor,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(color: baseFormTextColor, fontSize: 16),
                ),
              ),
            )
          ],
        ));

Route createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Widget onBoardingPageView(
        {required Size size,
        required String imagePath,
        required String text,
        double textSize = 20}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 0.15,
        ),
        Container(height: size.height * 0.4, child: Image.asset(imagePath)),
        SizedBox(
          height: size.height * 0.05,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            text,
            style: TextStyle(
                fontSize: textSize,
                color: onBoardColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: SizedBox(),
        ),
      ],
    );

Widget myElevatedButton(
        {required String text,
        required Function() function,
        Color color = Colors.green}) =>
    Container(
      height: 90,
      padding: EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: function,
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontFamily: "Bolt-Semibold"),
        )),
      ),
    );
