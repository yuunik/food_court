import 'package:flutter/material.dart';
import 'package:food_court/core/extension/double_fit.dart';

import 'package:food_court/core/model/meal_model.dart';
import 'package:food_court/core/extension/int_fit.dart';
import 'package:food_court/ui/widgets/meal_operation_item.dart';

final cardRadius = 12.px;

class MealCard extends StatelessWidget {
  final MealModel _mealInfo;

  const MealCard(this._mealInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: Column(
        children: [
          buildImageInfo(context),
          buildMealInfo()
        ],
      ),
    );
  }

  // 获取菜单图片信息
  Widget buildImageInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cardRadius),
            topRight: Radius.circular(cardRadius)
          ),
          child: Image.network(
            _mealInfo.imageUrl,
            width: double.infinity,
            fit: BoxFit.cover
          ),
        ),
        Positioned(
          bottom: 10.px,
          right: 50.px,
          left: 50.px,
          child: Container(
            padding: EdgeInsets.all(10.px),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.black54
            ),
            child: Center(
              child: Text(
                _mealInfo.title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontSize: 16.px
                )
              ),
            ),
          ),
        )
      ],
    );
  }

  // 获取菜单制作流程信息
  Widget buildMealInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.px,
        horizontal: 12.px
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MealOperationItem(
            const Icon(
              Icons.schedule,
            ),
            "${_mealInfo.duration} 分钟"
          ),
          MealOperationItem(
            const Icon(
              Icons.restaurant
            ),
            "${_mealInfo.complexityStr}"
          ),
          const MealOperationItem(
            Icon(
              Icons.favorite
            ),
            "已收藏"
          )
        ],
      ),
    );
  }
}
