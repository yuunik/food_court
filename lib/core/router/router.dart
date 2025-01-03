import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_court/ui/pages/detail/detail.dart';
import 'package:food_court/ui/pages/filter/filter.dart';
import 'package:food_court/ui/pages/main/main.dart';
import 'package:food_court/ui/pages/mealList/meal_list.dart';

class AppRouter {
  // 默认路由
  static const String initialRoute = MainConfig.routeName;

  // 路由表
  static final Map<String, WidgetBuilder> routes = {
    MainConfig.routeName: (context) => const MainConfig(),
    MealList.routeName: (context) => const MealList(),
    MealDetail.routeName: (context) => const MealDetail(),
    FilterPage.routeName: (context) => const FilterPage()
  };

  // 生成路由
  static RouteFactory? generateRoute = (settings) {
    if (settings.name == FilterPage.routeName) {
      // 跳转到过滤页
      return MaterialPageRoute(
        builder: (context) => const FilterPage(),
        fullscreenDialog: true
      );
    }
    return null;
  };

  // 任意路由
  static RouteFactory? unknownRoute = (settings) {
    return null;
  };
}
