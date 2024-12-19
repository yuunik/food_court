import 'dart:ui';

import 'package:flutter/material.dart';

class SizeFit {
  static late double physicalWidth;
  static late double physicalHeight;
  static late double screenWidth;
  static late double screenHeight;
  static late double devicePixelRatio;
  static late double statusBarHeight;
  static late double rpx;
  static late double px;

  // 初始化
  static initialize(BuildContext context, {double standardWidth = 750}) {
    // 获取设备信息
    final FlutterView deviceInfo = View.of(context);
    devicePixelRatio = deviceInfo.devicePixelRatio;
    physicalWidth = deviceInfo.physicalSize.width;
    physicalHeight = deviceInfo.physicalSize.height;
    screenWidth = physicalWidth / devicePixelRatio;
    screenHeight = physicalHeight / devicePixelRatio;
    statusBarHeight = deviceInfo.padding.top;
    // 设置 rpx
    rpx = screenWidth / standardWidth;
    px = rpx * 2;
  }

  // 设置rpx
  static setRpx(double size) => rpx * size;
  // 设置px
  static setPx(double size) => px * size;
}