import 'package:flutter/material.dart';

import 'package:food_court/core/model/meal_model.dart';
import 'package:food_court/core/extension/int_fit.dart';
import 'package:food_court/core/viewmodel/meal_view_model.dart';
import 'package:food_court/ui/pages/detail/detail.dart';
import 'package:food_court/ui/widgets/meal_operation_item.dart';
import 'package:provider/provider.dart';

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
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(MealDetail.routeName, arguments: _mealInfo);
        },
        child: Column(
          children: [
            buildImageInfo(context),
            buildMealInfo()
          ],
        ),
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
          child: buildImage()
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

  // 获取菜单图片
  Widget buildImage() {
    return Image.network(
      _mealInfo.imageUrl,
      width: double.infinity,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          // 图片加载完成
          return child;
        } else {
          return const Center(
              child: CircularProgressIndicator()
          );
        }
      },
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
            icon: const Icon(
              Icons.schedule,
            ),
            title: "${_mealInfo.duration} 分钟"
          ),
          MealOperationItem(
            icon: const Icon(
              Icons.restaurant
            ),
            title: "${_mealInfo.complexityStr}"
          ),
          buildFavoriteItem()
        ],
      ),
    );
  }
  
  // 是否收藏
  Widget buildFavoriteItem() {
    final isFavorite = _mealInfo.isFavorite;

    return Consumer<MealViewModel>(
      builder: (context, mealViewModel, child) {
        return GestureDetector(
          onTap: () {
            mealViewModel.handleFavorite(_mealInfo);
          },
          child: child,
        );
      },
      child: MealOperationItem(
          icon: isFavorite ? const Icon(Icons.favorite, color: Colors.redAccent) : const Icon(Icons.favorite_border),
          title: isFavorite ? "已收藏" : "收藏",
      ),
    );
  }
}
