import 'package:flutter/material.dart';

import 'package:food_court/core/extension/double_fit.dart';
import 'package:food_court/core/extension/int_fit.dart';
import 'package:food_court/core/model/category_model.dart';
import 'package:food_court/core/utils/json_parse.dart';
import 'package:food_court/ui/pages/home/home_content_item.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
          future: JsonParse.getCategoryList(),
          builder: (context, snapshot) {
            // 没有数据, 显示加载中
            if (!snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    Text(
                      "正在获取数据中...",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              );
            }
            // 数据获取失败
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  children: [
                    const Icon(Icons.error),
                    Text(
                      "数据获取失败",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              );
            }
            final categoryList = snapshot.data!;
            return GridView.builder(
              padding: EdgeInsets.all(20.0.px),
              itemCount: categoryList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 3,
                  mainAxisSpacing: 20.px,
                  crossAxisSpacing: 20.px
              ),
              itemBuilder: (context, index) {
                return HomeContentItem(categoryList[index]);
              },
            );
          },
        );
  }
}

