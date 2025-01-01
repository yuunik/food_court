import 'package:flutter/material.dart';
import 'package:food_court/ui/widgets/chorria_style_app.dart';

class MyFavorite extends StatelessWidget {
  // 路由名称
  static const String routeName = "/favorite";

  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return ChorriaStyleApp(
      title: "我的收藏",
      child: const Text("good")
    );
  }
}
