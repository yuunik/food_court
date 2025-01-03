import 'package:flutter/material.dart';

class ChorriaStyleApp extends StatelessWidget {
  final String title;
  final Widget child;
  // 悬浮按钮
  final Widget? floatingActionButton;
  // 侧边栏
  final Widget? drawer;
  // 导航栏左侧按钮
  final Widget? appBarLeading;
  // 底部导航栏
  final Widget? bottomNavigationBar;

  ChorriaStyleApp({
    required this.title,
    required this.child,
    this.floatingActionButton,
    this.drawer,
    this.appBarLeading,
    this.bottomNavigationBar,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: appBarLeading
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: child,
      floatingActionButton: floatingActionButton,
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
