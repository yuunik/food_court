import 'package:flutter/material.dart';

class FilterViewModel extends ChangeNotifier {
  // 是否为无谷蛋白
  bool _isGlutenFree = false;
  // 是否不含乳糖
  bool _isLactoseFree = false;
  // 是否为普通素食者
  bool _isVegetarian = false;
  // 是否为严格素食者
  bool _isVegan = false;

  bool get isGlutenFree => _isGlutenFree;

  set isGlutenFree(bool value) {
    _isGlutenFree = value;
    notifyListeners();
  }

  bool get isLactoseFree => _isLactoseFree;

  set isLactoseFree(bool value) {
    _isLactoseFree = value;
    notifyListeners();
  }

  bool get isVegan => _isVegan;

  set isVegan(bool value) {
    _isVegan = value;
    notifyListeners();
  }

  bool get isVegetarian => _isVegetarian;

  set isVegetarian(bool value) {
    _isVegetarian = value;
    notifyListeners();
  }
}