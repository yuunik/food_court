import 'dart:convert';

List<MealModel> mealModelFromJson(String str) => List<MealModel>.from(json.decode(str).map((x) => MealModel.fromJson(x)));

String mealModelToJson(List<MealModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// 操作难度
List<String> complexityArr = ["简单", "一般", "困难"];

class MealModel {
  String id;
  List<String> categories;
  String title;
  int affordability;
  int complexity;
  String? complexityStr;
  String imageUrl;
  int duration;
  List<String> ingredients;
  List<String> steps;
  bool isGlutenFree;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;
  bool isFavorite;

  MealModel({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.complexity,
    this.complexityStr,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
    required this.isFavorite
  });

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
    id: json["id"],
    categories: List<String>.from(json["categories"].map((x) => x)),
    title: json["title"],
    affordability: json["affordability"],
    complexity: json["complexity"],
    complexityStr: complexityArr[json["complexity"]],
    imageUrl: json["imageUrl"],
    duration: json["duration"],
    ingredients: List<String>.from(json["ingredients"].map((x) => x)),
    steps: List<String>.from(json["steps"].map((x) => x)),
    isGlutenFree: json["isGlutenFree"],
    isVegan: json["isVegan"],
    isVegetarian: json["isVegetarian"],
    isLactoseFree: json["isLactoseFree"],
    isFavorite: json["isFavorite"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "title": title,
    "affordability": affordability,
    "complexity": complexity,
    "complexityStr": complexityArr[complexity],
    "imageUrl": imageUrl,
    "duration": duration,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
    "steps": List<dynamic>.from(steps.map((x) => x)),
    "isGlutenFree": isGlutenFree,
    "isVegan": isVegan,
    "isVegetarian": isVegetarian,
    "isLactoseFree": isLactoseFree,
    "isFavorite": isFavorite
  };

  MealModel copyWith({
    String? id,
    List<String>? categories,
    String? title,
    int? affordability,
    int? complexity,
    String? complexityStr,
    String? imageUrl,
    int? duration,
    List<String>? ingredients,
    List<String>? steps,
    bool? isGlutenFree,
    bool? isVegan,
    bool? isVegetarian,
    bool? isLactoseFree,
    bool? isFavorite
  }) => MealModel(
    id: id ?? this.id,
    categories: categories ?? this.categories,
    title: title ?? this.title,
    affordability: affordability ?? this.affordability,
    complexity: complexity ?? this.complexity,
    complexityStr: complexityStr ?? this.complexityStr,
    imageUrl: imageUrl ?? this.imageUrl,
    duration: duration ?? this.duration,
    ingredients: ingredients ?? this.ingredients,
    steps: steps ?? this.steps,
    isGlutenFree: isGlutenFree ?? this.isGlutenFree,
    isVegan: isVegan ?? this.isVegan,
    isVegetarian: isVegetarian ?? this.isVegetarian,
    isLactoseFree: isLactoseFree ?? this.isLactoseFree,
    isFavorite: isFavorite ?? this.isFavorite
  );
}