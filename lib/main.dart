import 'package:flutter/material.dart';
import 'package:food_court/app.dart';
import 'package:food_court/core/viewmodel/filter_view_model.dart';
import 'package:food_court/core/viewmodel/meal_view_model.dart';
import 'package:provider/provider.dart';

main(List<String> args) => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FilterViewModel()),
      ChangeNotifierProxyProvider<FilterViewModel, MealViewModel>(
        create: (context) => MealViewModel(),
        update: (context, filterViewModel, mealViewModel) {
          // 创建 MealViewModel 时，需要传入 FilterViewModel
          mealViewModel!.updateFilterViewModel(filterViewModel);
          return mealViewModel;
        },
      )
    ],
    child: const App(),
  )
);
