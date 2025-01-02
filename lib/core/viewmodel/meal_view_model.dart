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

  handleFavorite(MealModel meal) {
    final mealIndex = _mealList.indexWhere((item) => item.id == meal.id);
    if (mealIndex != -1) {
      _mealList[mealIndex] = meal.copyWith(isFavorite: !meal.isFavorite);
      // 通知监听者
      notifyListeners();
    }
  }

  List<MealModel> get mealList => _mealList;
}