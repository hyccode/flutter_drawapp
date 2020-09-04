import 'package:fish_redux/fish_redux.dart';
import 'package:yubeiapp/data/protocol/response/user_info_entity.dart';

import 'action.dart';
import 'state.dart';

Reducer<UserEditState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserEditState>>{
      UserEditAction.action: _onAction,
      UserEditAction.showUserHead: _showUserHead,
    },
  );
}

UserEditState _onAction(UserEditState state, Action action) {
  final UserEditState newState = state.clone();
  return newState;
}

UserEditState _showUserHead(UserEditState state, Action action) {
  UserInfoEntity userInfoItem = action.payload;
  final UserEditState newState = state.clone();

  String headUrl = null;
  if (userInfoItem != null) {
    if (userInfoItem.avatar != null) {
      headUrl = userInfoItem.avatar;
    } else if (userInfoItem.wxAvatar != null) {
      headUrl = userInfoItem.wxAvatar;
    }
  }
  newState.headUrl = headUrl;
  newState.userInfoItem = userInfoItem;
  return newState;
}
