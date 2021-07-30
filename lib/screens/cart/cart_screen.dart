import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/cubit/cubit.dart';
import 'package:fresh_food/models/cart_model.dart';
import 'package:fresh_food/screens/cart/cubit/cubit.dart';
import 'package:fresh_food/screens/cart/cubit/states.dart';
import 'package:fresh_food/screens/delivery_address/delivery_address_screen.dart';
import 'package:fresh_food/screens/shop/cubit/cubit.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/style/myText.dart';
import 'package:fresh_food/style/my_colors.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    CartCubit.get(context).getCartFromFireStore(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var cartItems = ShopCubit.get(context).cartItems;
    return BlocConsumer<CartCubit, CartStates>(
      listener: (context, state) {},
      builder: (context, state) => state is CartStateLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
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
                        color: MainCubit.get(context).dark
                            ? Theme.of(context).primaryColor
                            : Colors.white,
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
                          return cartWidget(
                              size: size,
                              cartItem: cartItems.values.toList()[index]);
                        },
                        itemCount: cartItems.length,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 40, right: 40, top: 15, bottom: 5),
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
                      text: "CHECKOUT",
                      function: () {
                        ShopCubit.get(context).cartItems.isEmpty
                            ? showSnackBar(
                                context: context,
                                message: "Please add an item to the cart")
                            : Navigator.of(context)
                                .pushNamed(DeliveryAddress.id);
                      },
                      color: greenColor)
                ],
              ),
            ),
    );
  }

  GestureDetector cartWidget({required Size size, required CartItem cartItem}) {
    String quantity = cartItem.quantity!.toString();
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Theme.of(context).primaryColor,
                height: 80,
                width: size.width * 0.2,
                child: Image.network(
                  cartItem.image ?? "",
                  fit: BoxFit.scaleDown,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                height: 80,
                child: Center(
                    child: Text(
                  cartItem.name ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: bold16,
                )),
                width: size.width * 0.25,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                width: 50,
                height: 40,
                child: DropdownButton<String>(
                  value: quantity,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 14,
                  elevation: 16,
                  isExpanded: true,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  underline: SizedBox(),
                  onChanged: (String? newValue) {
                    setState(() {
                      CartCubit.get(context).changeQuantity(
                          cartItem, context, double.parse(newValue.toString()));
                      quantity = newValue.toString();
                      print(quantity);
                      print(cartItem.quantity!.toString());
                    });
                  },
                  items: CartCubit.get(context)
                      .cites
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: bold16,
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "kg",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 10,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                child: Text(
                  "${cartItem.price! * cartItem.quantity!.toDouble()} LE",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: bold16,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  CartCubit.get(context).deleteFromCart(cartItem, context);
                },
                child: Container(
                  width: 20,
                  height: 20,
                  child: Image.asset(
                    "images/delete.png",
                    color: Colors.red[900],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
