import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/models/cart_model.dart';
import 'package:fresh_food/screens/cart/cubit/cubit.dart';
import 'package:fresh_food/screens/cart/cubit/states.dart';
import 'package:fresh_food/screens/shop/cubit/cubit.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/style/myText.dart';
import 'package:fresh_food/style/my_colors.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
  double x = 0;
  double priceWidth = 70;
  double quantityWidth = 50;
  bool opened = false;
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var cartItems = ShopCubit.get(context).cartItems;
    return BlocConsumer<CartCubit, CartStates>(
      listener: (context, state) {},
      builder: (context, state) => SafeArea(
        child: Column(
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
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: Center(
                child: Text(
                  "Cart",
                  style: bold20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 5,
                  ),
                  itemBuilder: (context, index) {
                    print(cartItems.length);
                    return cartWidget(
                        size: size, cartItem: cartItems.values.toList()[index]);
                  },
                  itemCount: cartItems.length,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: bold20,
                  ),
                  Text(
                    "${ShopCubit.get(context).totalPrice} LE",
                    style: bold20,
                  )
                ],
              ),
            ),
            myElevatedButton(
                text: "CHECKOUT", function: () {}, color: greenColor)
          ],
        ),
      ),
    );
  }

  GestureDetector cartWidget({required Size size, required CartItem cartItem}) {
    return GestureDetector(
      onTap: () {
        print("YES");
        setState(() {
          if (widget.opened == false) {
            widget.opened = true;
            widget.x = 60;
            widget.quantityWidth = 0;
            widget.priceWidth = 0;
          } else {
            widget.opened = false;
            widget.x = 0;
            widget.priceWidth = 70;
            widget.quantityWidth = 50;
          }
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.blueGrey[50],
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.blueGrey[50],
                height: 80,
                width: size.width * 0.2,
                child: Image.network(
                  cartItem.image,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                ),
                height: 80,
                child: Center(
                    child: Text(
                  cartItem.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: bold16,
                )),
                width: size.width * 0.25,
              ),
              SizedBox(
                width: 10,
              ),
              Spacer(),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: widget.quantityWidth,
                child: Text(
                  "${cartItem.quantity} kg",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: widget.priceWidth,
                child: Text(
                  "${cartItem.price * cartItem.quantity} LE",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: bold16,
                ),
              ),
              if (!widget.opened)
                SizedBox(
                  width: 10,
                ),
              AnimatedContainer(
                width: widget.x,
                decoration: BoxDecoration(
                  color: greenColor,
                ),
                duration: Duration(milliseconds: 200),
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap: () {
                      print("EDIT !");
                    },
                    child: Image.asset(
                      "images/edit.png",
                      height: 40,
                      color: Colors.white,
                      width: 40,
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                width: widget.x,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                duration: Duration(milliseconds: 200),
                height: 80,
                child: GestureDetector(
                  onTap: () {
                    print("DELETE !");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset(
                      "images/delete.png",
                      height: 40,
                      color: Colors.white,
                      width: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
