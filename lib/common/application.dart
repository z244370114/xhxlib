import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/user_info.dart';
import '../network/http_utils.dart';
import 'k_key.dart';

class Application {
  static late GetStorage getStorage;
  static int userId = 0;
  static String userName = '';

  ///进入app就初始化，后期可以直接使用同步方法
  static Future initSp(storageKey) async {
    getStorage = GetStorage(storageKey);
  }

  ///判断是否登录
  static bool get isLogin {
    String? token = getStorage.read(Kkey.loginToken);
    var loginState = getStorage.read(Kkey.loginState);
    return GetUtils.isNull(token) && loginState;
  }

  ///登录初始化配置
  static void login(UserInfo? userInfo) {
    var userJson = jsonEncode(userInfo);
    Application.getStorage.write(Kkey.userInfo, userJson);
    HttpUtils.token = userInfo?.token;
    Application.getStorage.write(Kkey.userId, userInfo?.id);
    Application.getStorage.write(Kkey.loginState, true);
  }

  ///退出初始化配置
  static void loginOut() {
    HttpUtils.token = '';
    Application.getStorage.write(Kkey.loginState, false);
    Get.deleteAll();
    Get.offAllNamed('/login');
  }
}
