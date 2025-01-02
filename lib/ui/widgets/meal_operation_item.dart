import 'package:flutter/material.dart';

class MealOperationItem extends StatelessWidget {
  // 图标
  final Widget icon;
  // 标题
  final String title;

  const MealOperationItem({required this.icon, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 3,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
