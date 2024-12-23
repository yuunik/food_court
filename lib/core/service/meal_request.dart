import 'dart:convert';

import 'package:food_court/core/model/meal_model.dart';
import 'package:food_court/core/service/http_request.dart';

class MealRequest {
  static Future<List<MealModel>> getMealList() async {
    final res = await HttpRequest.send("/meal");
    final dataList = res['meal'];
    List<MealModel> mealList = [];
    for(var data in dataList) {
      mealList.add(json.decode(data));
    }
    return mealList;
  }
}