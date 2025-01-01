import 'package:flutter/material.dart';
import 'package:food_court/core/model/meal_model.dart';
import 'package:food_court/core/extension/int_fit.dart';
import 'package:food_court/ui/shared/app_theme.dart';
import 'package:food_court/ui/shared/size_fit.dart';

class MealDetailContent extends StatelessWidget {
  final MealModel _mealInfo;

  const MealDetailContent(this._mealInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // 菜单图片
          buildMenuImage(),
          buildItemTitle(context, "制作材料"),
          // 菜单材料说明
          buildMenuMaterial(),
          buildItemTitle(context, "制作流程"),
          // 菜单制作步骤
          buildMenuStep(context)
        ],
      ),
    );
  }

  // 菜单图片
  Widget buildMenuImage() {
    return Container(
      child: Image.network(
        _mealInfo.imageUrl
      ),
    );
  }

  // 菜单材料说明
  Widget buildMenuMaterial() {
    return buildListViewBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _mealInfo.ingredients.length,
        itemBuilder: (context, index) => Card(
            color: AppTheme.accentColor,
            child: Padding(
              padding: EdgeInsets.all(10.px),
              child: Text(
                _mealInfo.ingredients[index],
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400
                ),
              ),
            )
        ),
      ),
    );
  }

  // 菜单制作步骤
  Widget buildMenuStep(BuildContext context) {
    return buildListViewBox(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _mealInfo.steps.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            child: Text(
                "# $index"
            ),
          ),
          title: Text(
              _mealInfo.steps[index]
          ),
        ),
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }

  // 标题
  Widget buildItemTitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.px
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
          fontWeight: FontWeight.bold
        )
      ),
    );
  }

  // 构建列表视图盒子
  Widget buildListViewBox({required Widget child}) => Padding(
    padding: EdgeInsets.all(10.px),
    child: Container(
      padding: EdgeInsets.all(
        8.px
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.px),
        border: Border.all(
          color: Colors.grey,
          width: 2.px
        )
      ),
      child: child,
    ),
  );
}
