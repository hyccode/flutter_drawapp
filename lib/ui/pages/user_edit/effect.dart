import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:image_picker/image_picker.dart';
import 'package:yubeiapp/common/common.dart';
import 'package:yubeiapp/data/protocol/request/req_update_userinfo_entity.dart';
import 'package:yubeiapp/data/protocol/response/user_info_entity.dart';
import 'package:yubeiapp/data/repository/repository.dart';
import 'package:yubeiapp/global_store/action.dart';
import 'package:yubeiapp/global_store/store.dart';
import 'package:yubeiapp/ui/widgets/loading_dialog.dart';
import 'package:yubeiapp/utils/userInfo_util.dart';

import 'action.dart';
import 'state.dart';

Effect<UserEditState> buildEffect() {
  return combineEffects(<Object, Effect<UserEditState>>{
    Lifecycle.initState: _init,
    UserEditAction.action: _onAction,
    UserEditAction.choiceHeadPhoto: _choiceHeadPhoto,
    UserEditAction.updateUserInfo: _updateUserInfo,
  });
}

void _init(Action action, Context<UserEditState> ctx) {
  UserInfoUtil.getUserInfo().then((UserInfoEntity userInfoItem) {
    ctx.dispatch(UserEditActionCreator.showUserInfo(userInfoItem));
  });
}

void _onAction(Action action, Context<UserEditState> ctx) {}


void _choiceHeadPhoto(Action action, Context<UserEditState> ctx) async {
  var source = action.payload;
  try {
    File imageFile = (await ImagePicker.pickImage(source: source)) as File;
    ctx.dispatch(UserEditActionCreator.updateUserInfo(ReqUpdateUserinfoEntity(
        updateData: ReqUpdateUserinfoUpdateData(avatar: imageFile.path))));
//    DioUtil.getInstance()
//        .post<UploadEntity>(
//      Api.UP_LOAD,
//      data: await formData(imageFile),
//      onSendProgress: (received, total) {},
//    )
//        .listen((request) {
//      if (request.code == Constant.status_success) {
//        //更新用户信息接口
//        ctx.dispatch(
//          UserEditActionCreator.updateUserInfo(
//            UpdateUserInfo(
//              userImg: request.item.path,
//              userId: ctx.state.userInfoItem.guid,
//            ),
//          ),
//        );
//      }
//    });
  } catch (e) {
    ctx.state.pickImageError = e;
  }
}

void _updateUserInfo(Action action, Context<UserEditState> ctx) {
  ReqUpdateUserinfoEntity reqUpdateUserinfoEntity = action.payload;
  showLoadingProgress(null, ctx.context);
  Repository.updateUserInfo(reqUpdateUserinfoEntity).listen((request) {
    if (request.code == Constant.status_success) {
      UserInfoUtil.getUserInfo().then((UserInfoEntity userInfoItem) {
        if (reqUpdateUserinfoEntity.updateData.gender != null) {
          userInfoItem.gender = reqUpdateUserinfoEntity.updateData.gender;
        }
        if (reqUpdateUserinfoEntity.updateData.avatar != null) {
          userInfoItem.avatar = reqUpdateUserinfoEntity.updateData.avatar;
        }
        if (reqUpdateUserinfoEntity.updateData.nickname != null) {
          userInfoItem.nickname = reqUpdateUserinfoEntity.updateData.nickname;
        }
        if (reqUpdateUserinfoEntity.updateData.name != null) {
          userInfoItem.name = reqUpdateUserinfoEntity.updateData.name;
        }
        if (reqUpdateUserinfoEntity.updateData.age != null) {
          userInfoItem.age = reqUpdateUserinfoEntity.updateData.age;
        }
        UserInfoUtil.setUserInfo(userInfoItem);
        ctx.dispatch(UserEditActionCreator.showUserInfo(userInfoItem));
      });
    } else {}
  }, onDone: () {
    Navigator.pop(ctx.context);
  });
}

Future<FormData> formData(File file) async {
  int index = file.path.lastIndexOf(Platform.pathSeparator);
  String name = file.path.substring(index + 1);
  return FormData.fromMap({
    "file": await MultipartFile.fromFile(
      file.path,
      filename: name,
    ),
  });
}

void showLoadingProgress(msg, BuildContext context) {
  showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new LoadingDialog(
          //调用对话框
          text: msg == null ? '加载中...' : msg,
        );
      });
}
