import 'package:fish_redux/src/redux/basic.dart';
import 'package:yubeiapp/data/protocol/response/user_info_entity.dart';

enum HomeMyAction { action, loginOut, showUserInfo, refreshUserInfo }

class HomeMyActionCreator {
  static Action showUserInfo(UserInfoEntity userInfoItem) {
    return Action(HomeMyAction.showUserInfo, payload: userInfoItem);
  }

  static Action refreshUserInfo() {
    return Action(HomeMyAction.refreshUserInfo);
  }
}
