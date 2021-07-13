import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/models/meal_model.dart';
import 'package:fresh_food/screens/recipes/cubit/states.dart';
import 'package:fresh_food/shared/network/remote/http.dart';

class RecipesCubit extends Cubit<RecipesStates> {
  RecipesCubit() : super(RecipesStateInitial());

  static RecipesCubit get(context) => BlocProvider.of(context);

  //late Meal meal;

  List<Meal> meals = [];

  getVegan() async {
    emit(RecipesStateVeganLoading());
    await HttpHelper()
        .getData(
            url: "https://www.themealdb.com/api/json/v1/1/filter.php?c=vegan")
        .then((value) {
      var jsonResponse = jsonDecode(value) as Map<String, dynamic>;

      List mealsJson = jsonResponse["meals"];

      for (int i = 0; i < mealsJson.length; i++) {
        meals.add(Meal(
            strMeal: mealsJson[i]['strMeal'],
            strMealThumb: mealsJson[i]['strMealThumb'],
            idMeal: mealsJson[i]['idMeal']));
      }
      emit(RecipesStateVeganSuccess());
    }).catchError((e) {
      print(e.toString());
    });
  }
}
