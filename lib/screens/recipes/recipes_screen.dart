import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/models/meal_model.dart';
import 'package:fresh_food/screens/meal_details/meal_details_screen.dart';
import 'package:fresh_food/screens/recipes/cubit/cubit.dart';
import 'package:fresh_food/screens/recipes/cubit/states.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/style/myText.dart';

class RecipesScreen extends StatelessWidget {
  final List<Meal> myMeals = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocConsumer<RecipesCubit, RecipesStates>(
        listener: (context, state) {},
        builder: (context, state) => state is RecipesStateVeganLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.black12,
                              offset: Offset(0.7, 0.7)),
                        ],
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Column(
                      children: [
                        Spacer(),
                        Center(
                          child: Text(
                            "Recipes",
                            style: bold20,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 10, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              recipesTabContainer(
                                  size: size, text: "All", color: Colors.white),
                              SizedBox(
                                width: 10,
                              ),
                              recipesTabContainer(
                                  size: size,
                                  text: "Vegan",
                                  color: Colors.white),
                              SizedBox(
                                width: 10,
                              ),
                              recipesTabContainer(
                                  size: size,
                                  text: "Keto",
                                  color: Colors.white),
                              SizedBox(
                                width: 10,
                              ),
                              recipesTabContainer(
                                  size: size,
                                  text: "Paleo",
                                  color: Colors.white),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                              height: 250,
                              width: double.infinity,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      MealDetailsScreen.id,
                                      arguments: [
                                        RecipesCubit.get(context)
                                            .meals[index]
                                            .idMeal,
                                        RecipesCubit.get(context)
                                            .meals[index]
                                            .strMeal
                                      ]);
                                },
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          child: Image.network(
                                            RecipesCubit.get(context)
                                                .meals[index]
                                                .strMealThumb,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      height: 50,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            RecipesCubit.get(context)
                                                .meals[index]
                                                .strMeal,
                                            style: bold16,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: RecipesCubit.get(context).meals.length),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
