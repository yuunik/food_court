import 'package:flutter/material.dart';

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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary
      ),
      body: const Center(
        child: Text("首页"),
      )
    );
  }
}
