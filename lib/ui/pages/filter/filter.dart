import 'package:flutter/material.dart';
import 'package:food_court/ui/pages/filter/filter_content.dart';
import 'package:food_court/ui/widgets/chorria_style_app.dart';

class FilterPage extends StatelessWidget {
  static const String routeName = "/filter";

  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChorriaStyleApp(
      title: "过滤设置",
      child: const FilterContent()
    );
  }
}
