import 'xhxlib_platform_interface.dart';

class Xhxlib {
  Future<String?> getPlatformVersion() {
    return XhxlibPlatform.instance.getPlatformVersion();
  }

  Future<String?> getAppChannelId() {
    return XhxlibPlatform.instance.getAppChannelId();
  }
}
