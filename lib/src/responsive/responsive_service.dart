import 'dart:math';

import 'package:flutter/material.dart';

mixin ResponsiveService {
  static late double _screenWidth;
  static late double _screenHeight;

  static const Size _defaultDesignSize = Size(360, 690);

  static late Size _designSize;

  static init(double width, double height, {Size? designSize}) {
    _screenWidth = width;
    _screenHeight = height;
    _designSize = designSize ?? _defaultDesignSize;
  }

  static double get scaleWidth => _screenWidth / _designSize.width;
  static double get scaleHeight => _screenHeight / _designSize.height;

  static double get scaleText => min(scaleHeight, scaleWidth);

  static double setSp(fontSize) => fontSize * scaleText;

  static double setHeight(height) => height * scaleHeight;
  static double setWidth(width) => width * scaleWidth;
}
