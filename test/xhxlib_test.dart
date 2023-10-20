import 'package:flutter_test/flutter_test.dart';
import 'package:xhxlib/xhxlib.dart';
import 'package:xhxlib/xhxlib_platform_interface.dart';
import 'package:xhxlib/xhxlib_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockXhxlibPlatform
    with MockPlatformInterfaceMixin
    implements XhxlibPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final XhxlibPlatform initialPlatform = XhxlibPlatform.instance;

  test('$MethodChannelXhxlib is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelXhxlib>());
  });

  test('getPlatformVersion', () async {
    Xhxlib xhxlibPlugin = Xhxlib();
    MockXhxlibPlatform fakePlatform = MockXhxlibPlatform();
    XhxlibPlatform.instance = fakePlatform;

    expect(await xhxlibPlugin.getPlatformVersion(), '42');
  });
}
