import 'package:flutter/material.dart';
import 'package:food_court/ui/shared/app_theme.dart';
import 'package:food_court/core/router/router.dart';
import 'package:food_court/ui/shared/size_fit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // 设备信息初始化
    SizeFit.initialize(context);
    return MaterialApp(
      title: "Food Court",
      theme: AppTheme.normalTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
      onGenerateRoute: AppRouter.generateRoute,
      onUnknownRoute: AppRouter.unknownRoute
    );
  }
}
