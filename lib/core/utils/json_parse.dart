import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_court/core/model/category_model.dart';

class JsonParse {
  static Future<List<CategoryModel>> getCategoryList() async {
    // 加载 json 文件
    final String jsonStr = await rootBundle.loadString('assets/json/category.json');
    //转为 Map
    final result = json.decode(jsonStr);
    // 获取数据
    final resultList = result['category'];
    List<CategoryModel> categoryList = [];
    for (var item in resultList) {
      categoryList.add(CategoryModel.fromJson(item));
    }
    return categoryList;
  }
}