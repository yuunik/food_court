import 'package:food_court/ui/shared/size_fit.dart';

/// int 单位适配扩展
extension IntFit on int {
  // px适配
  double get px => toDouble() * SizeFit.px;
  // rpx适配
  double get rpx => toDouble() * SizeFit.rpx;
}