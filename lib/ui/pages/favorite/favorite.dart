import 'package:flutter/material.dart';

class MyFavorite extends StatelessWidget {
  // 路由名称
  static const String routeName = "/favorite";

  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的收藏"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: const Center(
        child: Text("我的收藏"),
      ),
    );
  }
}
