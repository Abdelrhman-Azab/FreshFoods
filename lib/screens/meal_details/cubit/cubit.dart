import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/models/meal_details.dart';
import 'package:fresh_food/screens/meal_details/cubit/states.dart';
import 'package:fresh_food/shared/network/remote/http.dart';
import 'dart:convert';

class MealDetailsCubit extends Cubit<MealDetailsStates> {
  MealDetailsCubit() : super(MealDetailsStateInitial());

  static MealDetailsCubit get(context) => BlocProvider.of(context);

  MealDetails mealDetails = MealDetails(
      idMeal: "idMeal",
      strMeal: "strMeal",
      strInstructions: "strInstructions",
      strMealThumb: '',
      strYoutube: '');

  getMealDetails({required String id}) async {
    emit(MealDetailsStateLoading());
    await HttpHelper()
        .getData(
            url: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id")
        .then((value) {
      var jsonResponse = jsonDecode(value);
      mealDetails = MealDetails(
        idMeal: id,
        strInstructions: jsonResponse['meals'][0]['strInstructions'],
        strMeal: jsonResponse['meals'][0]['strMeal'],
        strMealThumb: jsonResponse['meals'][0]['strMealThumb'],
        strYoutube: jsonResponse['meals'][0]['strYoutube'],
        strIngredient1: jsonResponse['meals'][0]['strIngredient1'],
        strIngredient2: jsonResponse['meals'][0]['strIngredient2'],
        strIngredient3: jsonResponse['meals'][0]['strIngredient3'],
        strIngredient4: jsonResponse['meals'][0]['strIngredient4'],
        strIngredient5: jsonResponse['meals'][0]['strIngredient5'],
        strIngredient6: jsonResponse['meals'][0]['strIngredient6'],
        strIngredient7: jsonResponse['meals'][0]['strIngredient7'],
        strIngredient8: jsonResponse['meals'][0]['strIngredient8'],
        strIngredient9: jsonResponse['meals'][0]['strIngredient9'],
        strIngredient10: jsonResponse['meals'][0]['strIngredient10'],
      );

      emit(MealDetailsStateSuccess());
    }).catchError((e) {
      print(e.toString());
      emit(MealDetailsStateFailed());
    });
  }
}
