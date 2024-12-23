import 'package:flutter/cupertino.dart';
import 'package:food_court/ui/pages/main/main.dart';
import 'package:food_court/ui/pages/mealList/mealList.dart';

class AppRouter {
  // 默认路由
  static const String initialRoute = MainConfig.routeName;

  // 路由表
  static final Map<String, WidgetBuilder> routes = {
    MainConfig.routeName: (context) => const MainConfig(),
    MealList.routeName: (context) => const MealList(),
  };

  // 生成路由
  static RouteFactory? generateRoute = (settings) {
    return null;
  };

  // 任意路由
  static RouteFactory? unknownRoute = (settings) {
    return null;
  };
}
