import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/cubit/cubit.dart';
import 'package:fresh_food/models/meal_model.dart';
import 'package:fresh_food/screens/meal_details/meal_details_screen.dart';
import 'package:fresh_food/screens/recipes/cubit/cubit.dart';
import 'package:fresh_food/screens/recipes/cubit/states.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/style/myText.dart';
import 'package:fresh_food/style/my_colors.dart';

class RecipesScreen extends StatefulWidget {
  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  final List<Meal> myMeals = [];

  int _selectedIndex = 0;

  changeindex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocProvider(
        create: (BuildContext context) =>
            RecipesCubit()..getRecipes("Vegetarian"),
        child: BlocConsumer<RecipesCubit, RecipesStates>(
          listener: (context, state) {},
          builder: (context, state) => SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black12,
                            offset: Offset(0.7, 0.7)),
                      ],
                      color: MainCubit.get(context).dark
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child: Container(
                    height: 120,
                    width: double.infinity,
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
                              tabContainer(
                                  onTap: () {
                                    changeindex(0);
                                    RecipesCubit.get(context)
                                        .getRecipes("Vegetarian");
                                  },
                                  textcolor: _selectedIndex == 0
                                      ? Colors.white
                                      : baseFormFillDarkColor,
                                  size: size,
                                  text: "Vegetarian",
                                  color: _selectedIndex == 0
                                      ? greenColor
                                      : MainCubit.get(context).dark
                                          ? Colors.grey[850]!
                                          : Colors.white),
                              SizedBox(
                                width: 10,
                              ),
                              tabContainer(
                                  onTap: () {
                                    changeindex(1);
                                    RecipesCubit.get(context)
                                        .getRecipes("Vegan");
                                  },
                                  size: size,
                                  textcolor: _selectedIndex == 1
                                      ? Colors.white
                                      : baseFormFillDarkColor,
                                  text: "Vegan",
                                  color: _selectedIndex == 1
                                      ? greenColor
                                      : MainCubit.get(context).dark
                                          ? Colors.grey[850]!
                                          : Colors.white),
                              SizedBox(
                                width: 10,
                              ),
                              tabContainer(
                                  textcolor: _selectedIndex == 2
                                      ? Colors.white
                                      : baseFormFillDarkColor,
                                  onTap: () {
                                    changeindex(2);
                                    RecipesCubit.get(context)
                                        .getRecipes("Breakfast");
                                  },
                                  size: size,
                                  text: "Breakfast",
                                  color: _selectedIndex == 2
                                      ? greenColor
                                      : MainCubit.get(context).dark
                                          ? Colors.grey[850]!
                                          : Colors.white),
                              SizedBox(
                                width: 10,
                              ),
                              tabContainer(
                                  onTap: () {
                                    changeindex(3);
                                    RecipesCubit.get(context)
                                        .getRecipes("Pasta");
                                  },
                                  textcolor: _selectedIndex == 3
                                      ? Colors.white
                                      : baseFormFillDarkColor,
                                  size: size,
                                  text: "Pasta",
                                  color: _selectedIndex == 3
                                      ? greenColor
                                      : MainCubit.get(context).dark
                                          ? Colors.grey[850]!
                                          : Colors.white),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          height: 250,
                          width: double.infinity,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(MealDetailsScreen.id, arguments: [
                                RecipesCubit.get(context).meals[index].idMeal,
                                RecipesCubit.get(context).meals[index].strMeal
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        RecipesCubit.get(context)
                                            .meals[index]
                                            .strMeal,
                                        style: bold16,
                                        overflow: TextOverflow.ellipsis,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
