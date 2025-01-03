import 'package:flutter/material.dart';
import 'package:food_court/ui/pages/favorite/favorite.dart';
import 'package:food_court/ui/pages/home/home.dart';

// 页面列表
List<Widget> pageList = <Widget>[
  const HomePage(),
  const MyFavorite()
];

// 底部导航栏配置
List<BottomNavigationBarItem> bottomNavigationBarItemList = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    label: "首页",
    icon: Icon(Icons.home)
  ),
  BottomNavigationBarItem(
    label: "收藏",
    icon: Icon(Icons.favorite)
  )
];

