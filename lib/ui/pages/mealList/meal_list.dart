import 'package:flutter/material.dart';

import 'package:food_court/core/model/category_model.dart';
import 'package:food_court/ui/pages/mealList/meal_list_content.dart';
import 'package:food_court/ui/widgets/chorria_style_app.dart';

class MealList extends StatelessWidget {
  static const String routeName = "/mealList";

  const MealList({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as CategoryModel;
    return ChorriaStyleApp(
      title: category.title!,
      child: const MealListContent()
    );
  }
}
