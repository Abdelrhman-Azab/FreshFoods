import 'package:flutter/material.dart';
import 'package:fresh_food/style/myText.dart';

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
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Center(child: Text("data")),
                    trailing:
                        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  ),
                  Expanded(
                    child: Container(
                      child: Image.asset(
                        "images/broccoli.png",
                      ),
                    ),
                  ),
                  Text(
                    "Vegetables",
                    style: bold30,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    child: Text(
                      "Browse",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    decoration: BoxDecoration(
                        color: Color(0xffDD4040),
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.only(left: 20, right: 10),
                    width: 150,
                    child: Column(
                      children: [
                        Expanded(child: Image.asset("images/strawberry-1.png")),
                        Text("Strawberry",
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    decoration: BoxDecoration(
                        color: Colors.yellow[600],
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 150,
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
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 150,
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
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 150,
                    child: Column(
                      children: [
                        Expanded(child: Image.asset("images/blackberry.png")),
                        Text("Blackberry",
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ],
              ),
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
