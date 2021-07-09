import 'package:flutter/material.dart';
import 'package:fresh_food/screens/home_screen.dart';
import 'package:fresh_food/screens/introduction/cubit/cubit.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/style/myText.dart';
import 'package:fresh_food/style/my_colors.dart';

class IntroductionScreen extends StatefulWidget {
  static const String id = "introduction";

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController _pageViewController = PageController();

  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
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
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: _pageViewController,
                        onPageChanged: (index) {
                          setState(() {
                            pageNumber = index;
                          });
                        },
                        children: [
                          onBoardingPageView(
                              imagePath: 'images/graphic-onboarding-shop.png',
                              size: size,
                              text:
                                  "  Quickly search and add healthy foods to your cart"),
                          onBoardingPageView(
                              imagePath: 'images/graphic-onboarding.png',
                              size: size,
                              textSize: 18,
                              text:
                                  "With one click you can add every ingredient for a recipe to your cart"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * 0.1,
                                ),
                                Text(
                                  "Recipe Preferences",
                                  style: TextStyle(
                                      color: onBoardColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(child: SizedBox()),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("All", style: bold16),
                                    Switch(
                                        value: true,
                                        activeColor: Colors.green,
                                        onChanged: (mybool) {})
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Vegan", style: bold16),
                                    Switch(
                                        value: true,
                                        activeColor: Colors.green,
                                        onChanged: (mybool) {})
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Vegetarian", style: bold16),
                                    Switch(
                                        value: true,
                                        activeColor: Colors.green,
                                        onChanged: (mybool) {})
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Paleo", style: bold16),
                                    Switch(
                                        value: true,
                                        activeColor: Colors.green,
                                        onChanged: (mybool) {})
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Keto", style: bold16),
                                    Switch(
                                        value: true,
                                        activeColor: Colors.green,
                                        onChanged: (mybool) {})
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Low Carb", style: bold16),
                                    Switch(
                                        value: true,
                                        activeColor: Colors.green,
                                        onChanged: (mybool) {})
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                Text(
                                  "Tailor your recipes, feed exactly how you like it",
                                  style: bold18,
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              color: pageNumber == 0
                                  ? onBoardColor
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              color: pageNumber == 1
                                  ? onBoardColor
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              color: pageNumber == 2
                                  ? onBoardColor
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                )),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          pageNumber == 2
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: defaultElevatedButton(
                      buttonText: 'Get Started',
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            HomeScreen.id, (route) => false);
                      }),
                )
              : GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "SKIP",
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
