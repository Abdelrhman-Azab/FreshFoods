import 'package:flutter/material.dart';
import 'package:fresh_food/shared/style/myText.dart';
import 'package:fresh_food/shared/style/my_colors.dart';

Widget defaultElevatedButton(
        {required String buttonText,
        required onPressed,
        double textSize = 14,
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
                size: textSize,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                buttonText,
                style:
                    TextStyle(fontSize: textSize, fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );

Widget defaultTextForm(
        {required String imagePath,
        TextInputType keyboard = TextInputType.name,
        required String hintText,
        bool password = false,
        required BuildContext context,
        required TextEditingController controller}) =>
    Container(
        height: 60,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6)),
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
                obscureText: password,
                controller: controller,
                keyboardType: keyboard,
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
        )),
      ),
    );

Widget settingsContainers(
        {required String text,
        required IconData icon,
        required onTap,
        required BuildContext context}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        width: double.infinity,
        height: 60,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.green,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: bold16,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );

Widget tabContainer(
        {required Size size,
        required String text,
        required Color textcolor,
        required Color color,
        required Function()? onTap}) =>
    GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 400),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 16, color: textcolor),
          ),
        ),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        height: 50,
        width: size.width * 0.21,
      ),
    );

Widget deliveryTabContainer(
        {required Size size,
        required String imagePath,
        required Color containerColor,
        required Color imageColor,
        required Function()? onTap}) =>
    GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 400),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Image.asset(
              imagePath,
              color: imageColor,
            )),
        decoration: BoxDecoration(
            color: containerColor, borderRadius: BorderRadius.circular(20)),
        height: 40,
        width: size.width * 0.2,
      ),
    );

Widget ingredientRow(
        {required String text1, required String text2, required Size size}) =>
    Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.4,
            child: Text(
              text1,
              style: bold16,
            ),
          ),
          Spacer(),
          Container(
            width: size.width * 0.4,
            child: Text(
              text2,
              style: bold16,
            ),
          )
        ],
      ),
    );

deliveryTextForm(
        {required String labelText,
        TextInputType keyboardType = TextInputType.name,
        int maxLength = 99,
        required TextEditingController controller}) =>
    Container(
      color: baseFormFillColor,
      child: TextFormField(
        maxLength: maxLength,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          counterText: "",
          labelStyle: TextStyle(color: onBoardColor),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );

showSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        // backgroundColor: Colors.grey[900],
        duration: Duration(milliseconds: 600),
        content: Text(message)),
  );
}
