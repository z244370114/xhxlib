import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'xhxlib_method_channel.dart';

abstract class XhxlibPlatform extends PlatformInterface {
  /// Constructs a XhxlibPlatform.
  XhxlibPlatform() : super(token: _token);

  static final Object _token = Object();

  static XhxlibPlatform _instance = MethodChannelXhxlib();

  /// The default instance of [XhxlibPlatform] to use.
  ///
  /// Defaults to [MethodChannelXhxlib].
  static XhxlibPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [XhxlibPlatform] when
  /// they register themselves.
  static set instance(XhxlibPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getAppChannelId() {
    throw UnimplementedError('getAppChannelId() has not been implemented.');
  }

}
