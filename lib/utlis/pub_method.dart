import 'package:in_app_review/in_app_review.dart';

import 'package:umeng_common_sdk/umeng_common_sdk.dart';

import '../xhxlib_platform_interface.dart';
import 'platform_utils.dart';

class PubMethodUtils {
  static void initUMengSdk(
    String androidAppkey,
    String iosAppkey,
  ) {
    if (PlatformUtils.isAndroid) {
      XhxlibPlatform.instance.getAppChannelId().then((value) {
        UmengCommonSdk.initCommon(androidAppkey, iosAppkey, value.toString());
      });
    } else if (PlatformUtils.isIOS) {
      UmengCommonSdk.initCommon(androidAppkey, iosAppkey, "ios");
    }
  }

  static void getInAppReview() async {
    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }
}
