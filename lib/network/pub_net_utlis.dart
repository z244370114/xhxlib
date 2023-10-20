import '/network/http_utils.dart';

import 'http_api.dart';

class PubHttpNetUtils {

  static Future yalieTongJi(Map<String, dynamic> map, bool isList) async {
    return HttpUtils.instance.requestNetWorkAy(Method.get,"https://unwatermarker.cn/parse/?url=",
        queryParameters: map, isList: isList);
  }


}
