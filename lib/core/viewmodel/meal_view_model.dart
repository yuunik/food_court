import 'package:flutter/material.dart';
import 'package:food_court/core/model/meal_model.dart';
import 'package:food_court/core/service/meal_request.dart';

class MealViewModel extends ChangeNotifier {
  List<MealModel> _mealList = [];

  MealViewModel() {
    getMealList();
  }

  getMealList() async {
    final res = await MealRequest.getMealList();
    _mealList = res;
    notifyListeners();
  }

  List<MealModel> get mealList => _mealList;
}