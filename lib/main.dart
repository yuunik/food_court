import 'package:flutter/material.dart';
import 'package:food_court/app.dart';
import 'package:food_court/core/viewmodel/meal_view_model.dart';
import 'package:provider/provider.dart';

main(List<String> args) => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MealViewModel())
    ],
    child: const App(),
  )
);
