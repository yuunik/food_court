import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'package:food_court/core/model/category_model.dart';
import 'package:food_court/core/model/meal_model.dart';
import 'package:food_court/core/viewmodel/meal_view_model.dart';
import 'package:food_court/ui/widgets/meal_card.dart';

class MealListContent extends StatelessWidget {
  const MealListContent({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as CategoryModel;

    return Selector<MealViewModel, List<MealModel>>(
      shouldRebuild: (previous, next) => !const ListEquality().equals(previous, next),
      builder: (context, mealModelList, child) {
        if (mealModelList.isEmpty) {
          return const TDEmpty(
            type: TDEmptyType.plain,
            emptyText: "暂无数据",
          );
        }
        return ListView.builder(
            itemCount: mealModelList.length,
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: MealCard(mealModelList[index])
            )
        );
      },
      selector: (context, mealViewModel) => mealViewModel.mealList.where((meal) => meal.categories.contains(category.id)).toList(),
    );
  }
}
