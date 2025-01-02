import 'package:flutter/material.dart';
import 'package:food_court/core/model/meal_model.dart';
import 'package:food_court/core/viewmodel/meal_view_model.dart';
import 'package:food_court/ui/widgets/meal_card.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class FavoriteContent extends StatelessWidget {
  const FavoriteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<MealViewModel, List<MealModel>>(
      shouldRebuild: (previous, next) => !const ListEquality().equals(previous, next),
      selector: (context, mealViewModel) => mealViewModel.mealList.where((meal) => meal.isFavorite).toList(),
      builder: (context, favoriteMealList, child) => ListView.builder(
        itemCount: favoriteMealList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: MealCard(favoriteMealList[index]),
        ),
      ),
    );
  }
}
