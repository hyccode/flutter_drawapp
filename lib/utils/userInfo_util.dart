import 'dart:convert';

import 'package:yubeiapp/data/protocol/response/user_info_entity.dart';
import 'package:yubeiapp/resources/shared_preferences_keys.dart';
import 'package:yubeiapp/utils/shared_preferences.dart';

class UserInfoUtil {
  static UserInfoEntity _userInfoItem;
  static String _userId;

  static Future<String> getUserId() async {
    if (_userId == null) {
      SpUtil sp = await SpUtil.getInstance();
      _userId = sp.getString(SharedPreferencesKeys.UserId);
    }
    return _userId;
  }

  static void setUserId(String userId) async {
    _userId = userId;
    SpUtil instance = await SpUtil.getInstance();
    instance.putString(SharedPreferencesKeys.UserId, _userId);
  }

  static Future<UserInfoEntity> getUserInfo() async {
    if (_userInfoItem == null) {
      SpUtil sp = await SpUtil.getInstance();
      String string = sp.getString(SharedPreferencesKeys.userInfo);
      if (string != null) {
        _userInfoItem = new UserInfoEntity.fromJson(json.decode(string));
      }
    }
    return _userInfoItem;
  }

  static void setUserInfo(UserInfoEntity userInfoItem) async {
    _userInfoItem = userInfoItem;
    SpUtil instance = await SpUtil.getInstance();
    instance.putString(
        SharedPreferencesKeys.userInfo, json.encode(userInfoItem));
  }

  static clearUserInfo() async {
    _userInfoItem = null;
    _userId=null;
    SpUtil instance = await SpUtil.getInstance();
    instance.remove(SharedPreferencesKeys.UserId);
    instance.remove(SharedPreferencesKeys.userInfo);
  }
}
