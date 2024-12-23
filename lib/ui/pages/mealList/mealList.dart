import 'package:flutter/material.dart';
import 'package:food_court/core/model/category_model.dart';
import 'package:food_court/core/service/meal_request.dart';

class MealList extends StatelessWidget {
  static const String routeName = "/mealList";

  const MealList({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as CategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title!,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Center(
        child: Text(
          "Good"
        ),
      )
    );
  }
}
