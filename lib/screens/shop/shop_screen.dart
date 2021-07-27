import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/cubit/cubit.dart';
import 'package:fresh_food/screens/product/product_screen.dart';
import 'package:fresh_food/screens/shop/cubit/cubit.dart';
import 'package:fresh_food/screens/shop/cubit/states.dart';
import 'package:fresh_food/style/myText.dart';

class ShopScreen extends StatelessWidget {
  static const id = "shop";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Shop",
            style: bold20,
          ),
        ),
        body: BlocConsumer<ShopCubit, ShopStates>(
          listener: (context, state) {},
          builder: (context, state) => state is ShopStateLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: EdgeInsets.all(10),
                  //color: Colors.grey[100],
                  child: GridView.count(
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    crossAxisCount: 2,
                    children: List.generate(
                        ShopCubit.get(context).products.length,
                        (index) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    ProductScreen.id,
                                    arguments:
                                        ShopCubit.get(context).products[index]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: MainCubit.get(context).dark
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Image.network(
                                      ShopCubit.get(context)
                                              .products[index]
                                              .photoLink ??
                                          "",
                                      width: 100,
                                      height: 100,
                                    ),
                                    Text(ShopCubit.get(context)
                                            .products[index]
                                            .name ??
                                        ""),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        "Price : ${ShopCubit.get(context).products[index].price} LE"),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.green),
                                        onPressed: () {
                                          ShopCubit.get(context).addToCart(
                                              ShopCubit.get(context)
                                                  .products[index],
                                              context);
                                          ShopCubit.get(context)
                                              .getCartTotalPrice();
                                        },
                                        child: Text("Add to the cart"))
                                  ],
                                ),
                              ),
                            )),
                  ),
                ),
        ));
  }
}
