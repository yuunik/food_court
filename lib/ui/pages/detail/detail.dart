import 'package:flutter/material.dart';
import 'package:food_court/core/model/meal_model.dart';

class MealDetail extends StatelessWidget {
  static const String routeName = "/mealDetail";

  const MealDetail({super.key});

  @override
  Widget build(BuildContext context) {
    MealModel mealInfo = ModalRoute.of(context)!.settings.arguments as MealModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("制作流程"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Center(
        child: Text(
          mealInfo.title
        ),
      ),
    );
  }
}
