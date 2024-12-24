import 'package:flutter/material.dart';
import 'package:food_court/core/model/category_model.dart';
import 'package:food_court/core/model/meal_model.dart';
import 'package:food_court/core/viewmodel/meal_view_model.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class MealListContent extends StatelessWidget {
  const MealListContent({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as CategoryModel;

    return Selector<MealViewModel, List<MealModel>>(
      shouldRebuild: (previous, next) => !const ListEquality().equals(previous, next),
      builder: (context, mealModelList, child) => ListView.builder(
        itemCount: mealModelList.length,
        itemBuilder: (context, index) => Text(mealModelList[index].title),
      ),
      selector: (context, mealViewModel) => mealViewModel.mealList.where((meal) => meal.categories.contains(category.id)).toList(),
    );
  }
}
