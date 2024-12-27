import 'package:flutter/material.dart';

class MealOperationItem extends StatelessWidget {
  // 图标
  final Widget operationIcon;
  // 标题
  final String title;

  const MealOperationItem(this.operationIcon, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        operationIcon,
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
