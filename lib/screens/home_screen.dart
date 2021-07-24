import 'package:flutter/material.dart';
import 'package:fresh_food/style/myText.dart';
import 'package:fresh_food/style/my_colors.dart';

class HomeScreen extends StatefulWidget {
  static const id = "home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/cutten.jpg")),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black12,
                        offset: Offset(0.7, 0.7))
                  ],
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              padding: EdgeInsets.only(bottom: 20),
            ),
          ),
          Container(
            height: 150,
            padding: EdgeInsets.only(top: 10),
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: Color(0xffDD4040),
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(left: 10, right: 5),
                  width: 165,
                  child: Column(
                    children: [
                      Expanded(child: Image.asset("images/strawberry-1.png")),
                      Text("Strawberry", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: Colors.yellow[600],
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: 165,
                  child: Column(
                    children: [
                      Expanded(child: Image.asset("images/banana-1.png")),
                      Text("Banana", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: Colors.orange[400],
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: 165,
                  child: Column(
                    children: [
                      Expanded(child: Image.asset("images/mango.png")),
                      Text("Mango", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: 165,
                  child: Column(
                    children: [
                      Expanded(child: Image.asset("images/blackberry.png")),
                      Text("Blackberry", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
