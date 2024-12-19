import 'package:flutter/material.dart';

import 'package:food_court/core/extension/double_fit.dart';
import 'package:food_court/core/extension/int_fit.dart';

class HomePage extends StatelessWidget {
  // 路由名称
  static const String routeName = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Center(
        child: Container(
          width: 200.rpx,
          height: 200.0.rpx,
          color: Colors.red,
          child: Center(
            child: Text(
              "Home",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.px
              ),
            ),
          ),
        )
      )
    );
  }
}
