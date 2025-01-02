import 'package:flutter/material.dart';
import 'package:food_court/ui/shared/size_fit.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).canvasColor,
      child: Column(
        children: [
          buildDrawerHeader(context),
          buildDrawerTile(
            context: context,
            leading: const Icon(Icons.restaurant),
            title: "进餐",
            handleTap: () {
              Navigator.of(context).pop();
            }
          ),
          buildDrawerTile(
            context: context,
            leading: const Icon(Icons.settings),
            title: "过滤",
            handleTap: () {
              Navigator.of(context).pop();
            }
          )
        ],
      ),
    );
  }

  // 构建 DrawerHeader
  Widget buildDrawerHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeFit.statusBarHeight,
      color: Theme.of(context).colorScheme.secondary,
      alignment: const Alignment(0, 0.3),
      child: Text(
          "开始动手",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 40
          )
      ),
    );
  }

  // 构建 DrawerTile
  Widget buildDrawerTile({required BuildContext context, required Widget leading, required String title, required handleTap}) {
    return ListTile(
      leading: leading,
      title: Text(
        title,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      onTap: handleTap,
    );
  }
}
