import 'package:fresh_food/models/meal_model.dart';

class MealDetails {
  String idMeal;
  String strMeal;
  String strInstructions;
  String strMealThumb;
  String strYoutube;
  String strIngredient1;
  String strIngredient2;
  String strIngredient3;
  String strIngredient4;
  String strIngredient5;
  String strIngredient6;
  String strIngredient7;
  String strIngredient8;
  String strIngredient9;
  String strIngredient10;

  MealDetails({
    required this.idMeal,
    required this.strMeal,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strYoutube,
    this.strIngredient1 = "",
    this.strIngredient2 = "",
    this.strIngredient3 = "",
    this.strIngredient4 = "",
    this.strIngredient5 = "",
    this.strIngredient6 = "",
    this.strIngredient7 = "",
    this.strIngredient8 = "",
    this.strIngredient9 = "",
    this.strIngredient10 = "",
  });
}
