import 'package:flutter/material.dart';
import 'package:food_court/core/model/meal_model.dart';
import 'package:food_court/core/viewmodel/meal_view_model.dart';
import 'package:food_court/ui/pages/detail/detail_content.dart';
import 'package:food_court/ui/shared/app_theme.dart';
import 'package:food_court/ui/widgets/chorria_style_app.dart';
import 'package:provider/provider.dart';

class MealDetail extends StatelessWidget {
  static const String routeName = "/mealDetail";

  const MealDetail({super.key});

  @override
  Widget build(BuildContext context) {
    String mealId = (ModalRoute.of(context)!.settings.arguments as MealModel).id;
    // 获取 mealViewModel
    final MealViewModel mealViewModel = Provider.of<MealViewModel>(context);
    final MealModel mealInfo = mealViewModel.mealList.firstWhere(
      (meal) => meal.id == mealId,
    );
    return ChorriaStyleApp(
      title: mealInfo.title,
      floatingActionButton: Consumer<MealViewModel>(
        builder: (context, mealViewModel, child) {
          return FloatingActionButton(
            onPressed: () => {
              mealViewModel.handleFavorite(mealInfo)
            },
            backgroundColor: AppTheme.accentColor,
            child: mealInfo.isFavorite ? const Icon(Icons.favorite, color: Colors.redAccent) : const Icon(Icons.favorite_border)
          );
        },
      ),
      child: MealDetailContent(mealInfo),
    );
  }
}
