import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorState = GlobalKey();

class Constant {
  /// debug开关，上线需要关闭
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction = bool.fromEnvironment('dart.vm.product');

  // static const bool inProduction = false;

  static const String accessToken = 'Authorization';

  static const String theme = 'AppTheme';
}


