import 'package:flutter/material.dart';
import 'package:fresh_food/screens/product/product_screen.dart';
import 'package:fresh_food/screens/shop/cubit/cubit.dart';

class HomeScreen extends StatefulWidget {
  static const id = "home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    if (ShopCubit.get(context).products.isEmpty) {
      ShopCubit.get(context).getProducts();
    }
    super.initState();
  }

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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(ProductScreen.id,
                        arguments: ShopCubit.get(context).products[0]);
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    decoration: BoxDecoration(
                        color: Color(0xffDD4040),
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.only(left: 10, right: 5),
                    width: 165,
                    child: Column(
                      children: [
                        Expanded(child: Image.asset("images/strawberry-1.png")),
                        Text("Strawberry",
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(ProductScreen.id,
                        arguments: ShopCubit.get(context).products[6]);
                  },
                  child: Container(
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
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(ProductScreen.id,
                        arguments: ShopCubit.get(context).products[5]);
                  },
                  child: Container(
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
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(ProductScreen.id,
                        arguments: ShopCubit.get(context).products[1]);
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 165,
                    child: Column(
                      children: [
                        Expanded(child: Image.asset("images/blackberry.png")),
                        Text("Blackberry",
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
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
