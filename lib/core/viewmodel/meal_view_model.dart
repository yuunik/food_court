import 'package:flutter/material.dart';
import 'package:food_court/core/model/meal_model.dart';
import 'package:food_court/core/service/meal_request.dart';
import 'package:food_court/core/viewmodel/filter_view_model.dart';

class MealViewModel extends ChangeNotifier {
  List<MealModel> _mealList = [];
  // filterViewModel
  FilterViewModel? _filterViewModel;

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

  // 更新filterViewModel
  updateFilterViewModel(FilterViewModel filterViewModel) {
    _filterViewModel = filterViewModel;
    notifyListeners();
  }

  List<MealModel> get mealList => _mealList.where((meal) {
    if (_filterViewModel!.isGlutenFree && !meal.isGlutenFree) {
      return false;
    } else if (_filterViewModel!.isLactoseFree && !meal.isLactoseFree) {
      return false;
    } else if (_filterViewModel!.isVegetarian && !meal.isVegetarian) {
      return false;
    } else if (_filterViewModel!.isVegan && !meal.isVegan) {
      return false;
    } else {
      return true;
    }
  }).toList();
}