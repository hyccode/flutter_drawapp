import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:yubeiapp/data/protocol/response/user_info_entity.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeMyState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeMyState>>{
      HomeMyAction.action: _onAction,
      HomeMyAction.showUserInfo: _showUserInfo,
    },
  );
}

HomeMyState _onAction(HomeMyState state, Action action) {
  final HomeMyState newState = state.clone();
  return newState;
}


HomeMyState _showUserInfo(HomeMyState state, Action action) {
  UserInfoEntity userInfoItem = action.payload;
  final HomeMyState newState = state.clone();
  String headUrl = null;
  if (userInfoItem != null) {
    if (userInfoItem.avatar != null) {
      headUrl = userInfoItem.avatar;
    } else if (userInfoItem.wxAvatar != null) {
      headUrl = userInfoItem.wxAvatar;
    }
  }
  newState.headUrl = headUrl;
  newState.userInfoItem=userInfoItem;
  return newState;
}
