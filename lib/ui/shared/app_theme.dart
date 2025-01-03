import 'package:flutter/material.dart';

/// 主题配置类
class AppTheme {
  // 文本大小配置
  static const double bodyTextSize = 14;
  static const double bottomNavigationBarTextSize = 14;
  static const double smallTextSize = 16;
  static const double normalTextSize = 20;
  static const double largeTextSize = 24;

  // 颜色配置
  static const Color accentColor = Colors.amberAccent;

  // 正常模式的主题配置
  static const Color normalColor = Colors.pink;
  static final ThemeData normalTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blueAccent
    ),
    canvasColor: const Color.fromRGBO(255, 254, 222, 1),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: bodyTextSize
      ),
      displaySmall: TextStyle(
        fontSize: smallTextSize,
        color: Colors.black87
      ),
      displayMedium: TextStyle(
        fontSize: normalTextSize,
        color: Colors.black87
      ),
      displayLarge: TextStyle(
        fontSize: largeTextSize,
        color: Colors.black87
      )
    )
  );

  // 暗黑模式的主题配置
  static const Color darkColor = Colors.white;
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black
    ),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            fontSize: bodyTextSize
        ),
        displaySmall: TextStyle(
            fontSize: smallTextSize
        ),
        displayMedium: TextStyle(
            fontSize: normalTextSize
        ),
        displayLarge: TextStyle(
            fontSize: largeTextSize
        )
    )
  );
}