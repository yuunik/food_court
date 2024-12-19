import 'package:food_court/ui/shared/size_fit.dart';

/// double 单位适配扩展
extension DoubleFit on double {
  // px适配
  double get px => this * SizeFit.px;

  // rpx适配
  double get rpx => this * SizeFit.rpx;
}