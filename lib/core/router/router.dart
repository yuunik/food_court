import 'package:flutter/cupertino.dart';
import 'package:food_court/ui/pages/main/main.dart';

class AppRouter {
  // 默认路由
  static const String initialRoute = MainConfig.routeName;

  // 路由表
  static final Map<String, WidgetBuilder> routes = {
    MainConfig.routeName: (context) => const MainConfig()
  };

  // 生成路由
  static RouteFactory? generateRoute = (settings) {};

  // 任意路由
  static RouteFactory? unknownRoute = (settings) {};
}