import 'package:flutter/material.dart';
import 'package:food_court/core/extension/int_fit.dart';
import 'package:food_court/core/viewmodel/filter_view_model.dart';
import 'package:provider/provider.dart';

class FilterContent extends StatelessWidget {
  const FilterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSelectionTip(context),
        buildChoiceOption()
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
  Widget buildChoiceOption() {
    return Consumer<FilterViewModel>(
      builder: (context, filterViewModel, child) => Expanded(
        child: ListView(
          children: [
            buildSelectionTile(
              title: "无谷蛋白",
              isChecked: filterViewModel.isGlutenFree,
              onChanged: (value) {
                filterViewModel.isGlutenFree = value;
              }
            ),
            buildSelectionTile(
              title: "不含乳糖",
              isChecked: filterViewModel.isLactoseFree,
              onChanged: (value) {
                filterViewModel.isLactoseFree = value;
              }
            ),
            buildSelectionTile(
              title: "普通素食者",
              isChecked: filterViewModel.isVegetarian,
              onChanged: (value) {
                filterViewModel.isVegetarian = value;
              }
            ),
            buildSelectionTile(
              title: "严格素食者",
              isChecked: filterViewModel.isVegan,
              onChanged: (value) {
                filterViewModel.isVegan = value;
              }
            )
          ],
        ),
      ),
    );
  }

  Widget buildSelectionTile({required String title, required bool isChecked, required ValueChanged onChanged}) {
    return ListTile(
      title: Text(title),
      subtitle: Text("展示$title相关食物"),
      trailing: Switch(
        value: isChecked,
        onChanged: onChanged
      ),
    );
  }
}
