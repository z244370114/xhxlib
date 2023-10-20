import 'dart:ui';

import 'package:flutter/material.dart';

class KColor {
  ///主色，决定导航栏颜色
  static const Color primary = Color(0xFFFFFFFF);

  ///主高亮色
  static const Color primary_light = primary;

  ///主暗色
  static const Color primary_dark = primary;

  ///次级色，决定大多数Widget的颜色，如进度条、开关等。
  static const Color accent = primary;

  ///卡片颜色
  static const Color card = primary;

  static const Color divider = Color(0xFFEBEEF5);

  ///通用黑色字体
  static const Color blackColor = Color(0xFF333333);
  ///灰色
  static const Color greyColor = Color(0xFF666666);
}
