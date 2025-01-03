import 'package:flutter/material.dart';
import 'package:food_court/core/extension/int_fit.dart';

class FilterContent extends StatelessWidget {
  const FilterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSelectionTip(context),
        buildSelectOption()
      ],
    );
  }

  // 提示
  Widget buildSelectionTip(BuildContext context) {
    return Container(
      alignment: const Alignment(0, 0),
      padding: EdgeInsets.symmetric(
        vertical: 12.px
      ),
      child: Text(
        "展示你的选择",
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
          fontSize: 35,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  // 选项
  Widget buildSelectOption() {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        buildSelectTile("无谷蛋白"),
        buildSelectTile("不含乳糖"),
        buildSelectTile("普通素食者"),
        buildSelectTile("严格素食者"),
      ],
    );
  }

  Widget buildSelectTile(String content) {
    return ListTile(
      title: Text(content),
      subtitle: Text("展示$content相关食物"),
      trailing: Switch(
        value: false,
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }
}
