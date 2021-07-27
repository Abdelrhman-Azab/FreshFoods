import 'package:flutter/material.dart';
import 'package:fresh_food/cubit/cubit.dart';
import 'package:fresh_food/models/product.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/style/myText.dart';
import 'package:fresh_food/style/my_colors.dart';

class ProductScreen extends StatelessWidget {
  static const id = "product";

  @override
  Widget build(BuildContext context) {
    final model = ModalRoute.of(context)!.settings.arguments as Product;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MainCubit.get(context).dark
          ? Theme.of(context).primaryColor
          : Colors.white,
      appBar: AppBar(
        title: Text(model.name ?? ""),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                color: MainCubit.get(context).dark
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                height: 300,
                width: double.infinity,
                child: Image.network(
                  model.photoLink ?? "",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              defaultElevatedButton(
                  buttonText: "Add to the cart",
                  onPressed: () {},
                  textSize: 18,
                  iconData: Icons.add_shopping_cart),
              SizedBox(
                height: 20,
              ),
              Text(
                "Description",
                style: boldGreen20,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                model.description ?? "",
                style: TextStyle(height: 1.8),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Nutrition", style: boldGreen20),
                  Text(
                    "  (100 grams)",
                    style:
                        TextStyle(fontSize: 10, color: baseFormFillDarkColor),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              rowWidget(
                  model: model,
                  title: "Calories",
                  nutrition: "Calories",
                  g: ""),
              rowWidget(model: model, title: "Carbs", nutrition: "Carbs"),
              rowWidget(model: model, title: "Fat", nutrition: "Fat"),
              rowWidget(model: model, title: "Fiber", nutrition: "Fiber"),
              rowWidget(model: model, title: "Protein", nutrition: "Protein"),
              rowWidget(model: model, title: "Sugar", nutrition: "Sugar"),
            ],
          ),
        ),
      ),
    );
  }

  Padding rowWidget(
      {required Product model,
      required String title,
      required String nutrition,
      String g = " g"}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Text(
            title,
            style: bold16,
          ),
          Spacer(),
          Text(
            model.nutrition?[nutrition] + g ?? "",
            style: bold16,
          )
        ],
      ),
    );
  }
}
