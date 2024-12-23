import 'package:flutter/material.dart';

import 'package:food_court/ui/pages/home/home_content.dart';

class HomePage extends StatelessWidget {
  // 路由名称
  static const String routeName = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Food Court"),
          centerTitle: true,
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .primary,
        ),
        backgroundColor: Theme
            .of(context)
            .canvasColor,
        body: const HomeContent()
    );
  }
}