import 'package:json2dart_safe/json2dart.dart';

class UserInfo {
  String? blockListCode;
  String? createTime;
  String? createUser;
  int? delFlag;
  String? deptInfoId;
  int? id;
  String? loginName;
  String? mobilePhone;
  String? password;
  String? planListCode;
  String? remark;
  String? token;

  UserInfo({
    this.blockListCode,
    this.createTime,
    this.createUser,
    this.delFlag,
    this.deptInfoId,
    this.id,
    this.loginName,
    this.mobilePhone,
    this.password,
    this.planListCode,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{}
      ..put('blockListCode', this.blockListCode)
      ..put('createTime', this.createTime)
      ..put('createUser', this.createUser)
      ..put('delFlag', this.delFlag)
      ..put('deptInfoId', this.deptInfoId)
      ..put('id', this.id)
      ..put('loginName', this.loginName)
      ..put('mobilePhone', this.mobilePhone)
      ..put('password', this.password)
      ..put('planListCode', this.planListCode);
  }

  UserInfo.fromJson(Map<dynamic, dynamic> json) {
    this.blockListCode = json.asString('blockListCode');
    this.createTime = json.asString('createTime');
    this.createUser = json.asString('createUser');
    this.delFlag = json.asInt('delFlag');
    this.deptInfoId = json.asString('deptInfoId');
    this.id = json.asInt('id');
    this.loginName = json.asString('loginName');
    this.mobilePhone = json.asString('mobilePhone');
    this.password = json.asString('password');
  }
}
