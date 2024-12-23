import 'package:flutter/material.dart';

import 'package:food_court/core/extension/double_fit.dart';
import 'package:food_court/core/extension/int_fit.dart';
import 'package:food_court/core/model/category_model.dart';
import 'package:food_court/core/utils/json_parse.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<CategoryModel> _categoryList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 获取分类列表
    _getCategoryList();
  }

  // 获取分类列表
  Future<void> _getCategoryList() async {
    final categoryList = await JsonParse.getCategoryList();
    setState(() {
      _categoryList = categoryList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Food Court"),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        backgroundColor: Theme.of(context).canvasColor,
        body: GridView.builder(
          padding: EdgeInsets.all(8.0.px),
          itemCount: _categoryList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 3,
            mainAxisSpacing: 10.px,
            crossAxisSpacing: 10.px
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      _categoryList[index].color!.withOpacity(.5),
                      _categoryList[index].color!.withOpacity(.6),
                      _categoryList[index].color!,
                    ]),
                borderRadius: BorderRadius.circular(12.px),
              ),
              child: Center(
                child: Text(
                  _categoryList[index].title!,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
            );
          },
        )
    );
  }
}
