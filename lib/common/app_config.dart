import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final String apiBaseUrl;
  final bool proxy;

  const AppConfig({
    Key? key,
    required this.apiBaseUrl,
    required this.proxy,
    required Widget child,
  }) : super(key: key, child: child);

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: AppConfig)!;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
