import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'xhxlib_platform_interface.dart';

/// An implementation of [XhxlibPlatform] that uses method channels.
class MethodChannelXhxlib extends XhxlibPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('xhxlib');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getAppChannelId() async {
    final channel = await methodChannel.invokeMethod<String>('getAppChannelId');
    return channel;
  }

}
