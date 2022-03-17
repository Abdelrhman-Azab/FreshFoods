import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/screens/meal_details/cubit/cubit.dart';
import 'package:fresh_food/screens/meal_details/cubit/states.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/shared/style/myText.dart';
import 'package:fresh_food/shared/style/my_colors.dart';

class MealDetailsScreen extends StatelessWidget {
  static const id = "meal_details";
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as List;
    String mealId = arguments[0];
    String mealName = arguments[1];
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          mealName,
          overflow: TextOverflow.ellipsis,
          style: bold20,
        ),
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => MealDetailsCubit()..getMealDetails(id: mealId),
        child: BlocConsumer<MealDetailsCubit, MealDetailsStates>(
            listener: (context, state) {},
            builder: (context, state) => state is MealDetailsStateLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : BlocProvider(
                    create: (context) => MealDetailsCubit(),
                    child: SingleChildScrollView(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                MealDetailsCubit.get(context)
                                    .mealDetails
                                    .strMealThumb,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Ingredians",
                            style: boldGreen20,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ingredientRow(
                              text1: MealDetailsCubit.get(context)
                                  .mealDetails
                                  .strIngredient1,
                              size: size,
                              text2: MealDetailsCubit.get(context)
                                  .mealDetails
                                  .strIngredient2),
                          ingredientRow(
                              size: size,
                              text1: MealDetailsCubit.get(context)
                                  .mealDetails
                                  .strIngredient3,
                              text2: MealDetailsCubit.get(context)
                                  .mealDetails
                                  .strIngredient4),
                          ingredientRow(
                              size: size,
                              text1: MealDetailsCubit.get(context)
                                  .mealDetails
                                  .strIngredient5,
                              text2: MealDetailsCubit.get(context)
                                  .mealDetails
                                  .strIngredient6),
                          ingredientRow(
                              size: size,
                              text1: MealDetailsCubit.get(context)
                                  .mealDetails
                                  .strIngredient7,
                              text2: MealDetailsCubit.get(context)
                                  .mealDetails
                                  .strIngredient8),
                          MealDetailsCubit.get(context)
                                      .mealDetails
                                      .strIngredient9 ==
                                  ""
                              ? Container()
                              : ingredientRow(
                                  size: size,
                                  text1: MealDetailsCubit.get(context)
                                      .mealDetails
                                      .strIngredient9,
                                  text2: MealDetailsCubit.get(context)
                                      .mealDetails
                                      .strIngredient10),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Instructions",
                            style: TextStyle(
                                color: greenColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            MealDetailsCubit.get(context)
                                .mealDetails
                                .strInstructions,
                            style: TextStyle(
                                color: baseFormFillDarkColor, height: 1.8),
                          ),
                        ],
                      ),
                    )),
                  )),
      ),
    );
  }
}
