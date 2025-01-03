import 'package:flutter/material.dart';

import 'package:food_court/ui/pages/home/home_content.dart';
import 'package:food_court/ui/widgets/chorria_style_app.dart';

class HomePage extends StatelessWidget {
  // 路由名称
  static const String routeName = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChorriaStyleApp(
      title: "美食广场",
      appBarLeading: IconButton(
        onPressed: () => {
          Scaffold.of(context).openDrawer()
        },
        icon: const Icon(Icons.menu),
      ),
      child: const HomeContent(),
    );
  }
}