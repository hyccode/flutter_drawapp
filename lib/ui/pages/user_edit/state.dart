import 'dart:ui';

import 'package:yubeiapp/data/protocol/response/user_info_entity.dart';
import 'package:yubeiapp/global_store/state.dart';

class UserEditState implements GlobalBaseState<UserEditState> {
  String headUrl;
  UserInfoEntity userInfoItem;

//  File imageFile;
  dynamic pickImageError;
  String retrieveDataError;

  DateTime selectDateTime;

  @override
  UserEditState clone() {
    return UserEditState()
      ..headUrl = headUrl
      ..userInfoItem = userInfoItem
      ..pickImageError = pickImageError
      ..themeColor = themeColor
      ..retrieveDataError = retrieveDataError;
  }

  @override
  Color themeColor;
}

UserEditState initState(Map<String, dynamic> args) {
  return UserEditState();
}
