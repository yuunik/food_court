import 'package:flutter/material.dart';

import 'package:food_court/core/extension/int_fit.dart';
import 'package:food_court/core/model/category_model.dart';
import 'package:food_court/ui/pages/mealList/meal_list.dart';

class HomeContentItem extends StatelessWidget {
  final CategoryModel _categoryModel;

  const HomeContentItem(this._categoryModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(MealList.routeName, arguments: _categoryModel);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                _categoryModel.color!.withOpacity(.5),
                _categoryModel.color!
              ]),
          borderRadius: BorderRadius.circular(12.px),
        ),
        child: Center(
          child: Text(
              _categoryModel.title!,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold
              )
          ),
        ),
      ),
    );
  }
}

