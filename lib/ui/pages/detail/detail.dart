import 'package:flutter/material.dart';
import 'package:food_court/core/model/meal_model.dart';
import 'package:food_court/ui/pages/detail/detail_content.dart';
import 'package:food_court/ui/widgets/chorria_style_app.dart';

class MealDetail extends StatelessWidget {
  static const String routeName = "/mealDetail";

  const MealDetail({super.key});

  @override
  Widget build(BuildContext context) {
    MealModel mealInfo = ModalRoute.of(context)!.settings.arguments as MealModel;
    return ChorriaStyleApp(
      title: mealInfo.title,
      child: MealDetailContent(mealInfo)
    );
  }
}
