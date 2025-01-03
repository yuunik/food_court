import 'package:flutter/material.dart';
import 'package:food_court/ui/pages/main/main_drawer.dart';
import 'package:food_court/ui/pages/main/initalize_items.dart';
import 'package:food_court/ui/shared/app_theme.dart';

class MainConfig extends StatefulWidget {
  // 路由名称
  static const String routeName = "/";

  const MainConfig({super.key});

  @override
  State<MainConfig> createState() => _MainConfigState();
}

class _MainConfigState extends State<MainConfig> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: AppTheme.bottomNavigationBarTextSize,
        unselectedFontSize: AppTheme.bottomNavigationBarTextSize,
        items: bottomNavigationBarItemList,
        onTap: (index) => setState(() {
          _currentIndex = index;
        })
      ),
    );
  }
}

