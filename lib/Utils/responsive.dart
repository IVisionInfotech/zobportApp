import 'package:flutter/widgets.dart';

class AppDimensions {
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static EdgeInsets getPaddingAll(double padding) {
    return EdgeInsets.all(padding);
  }

  static EdgeInsets getPaddingSymmetric(
      {double horizontal = 0.0, double vertical = 0.0}) {
    return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  }

  static EdgeInsets getPaddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);
  }
}
