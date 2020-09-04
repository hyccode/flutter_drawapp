import 'dart:ui';

import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yubeiapp/data/protocol/request/req_update_userinfo_entity.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    UserEditState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: new AppBar(
      backgroundColor: state.themeColor,
      title: Text("个人资料"),
      leading: BackButton(),
      actions: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: () {},
              child: Text("保存"),
            ),
          ),
        )
      ],
    ),
    body: Builder(
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    showBottomDialog(state, dispatch, viewService, 1);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("头像"),
                        Container(
                            width: 60.0,
                            height: 60.0,
                            color: Colors.green,
                            child: (state.headUrl == null)
                                ? null
                                : Image.asset(state.headUrl)
//                      : CachedNetworkImage(
//                          imageUrl: state.headUrl,
//                          errorWidget: (context, url, error) =>
//                              Icon(Icons.error),
//                          placeholder: (context, url) =>
//                              CircularProgressIndicator(),
//                        ),
                            ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Row(
                    children: <Widget>[
                      Text("昵称"),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                        textAlign: TextAlign.end,
                      )),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                  child: GestureDetector(
                    onTap: () {
                      showBottomDialog(state, dispatch, viewService, 2);
                    },
                    child: Row(
                      children: <Widget>[
                        Text("性别"),
                        Expanded(
                            child: Text(
                          (state.userInfoItem == null ||
                                  state.userInfoItem.gender == null ||
                                  state.userInfoItem.gender == 0)
                              ? ""
                              : ((state.userInfoItem.gender == 1) ? "男" : "女"),
                          textAlign: TextAlign.end,
                        )),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                  child: GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup<void>(
                        context: context,
                        builder: (BuildContext context) {
                          state.selectDateTime = DateTime.now();
                          return _buildBottomPicker(
                            CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: DateTime.now(),
                              onDateTimeChanged: (DateTime selectDateTime) {
                                state.selectDateTime = selectDateTime;
                              },
                            ),
                            context,
                            state,
                            dispatch,
                          );
                        },
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Text("生日"),
                        Expanded(
                            child: Text(
                          "",
                          textAlign: TextAlign.end,
                        )),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Row(
                    children: <Widget>[
                      Text("真实姓名"),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                        textAlign: TextAlign.end,
                      )),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Row(
                    children: <Widget>[
                      Text("地址"),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.end,
                      )),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Row(
                    children: <Widget>[
                      Text("行业"),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                        textAlign: TextAlign.end,
                      )),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Row(
                    children: <Widget>[
                      Text("公司"),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                        textAlign: TextAlign.end,
                      )),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Row(
                    children: <Widget>[
                      Text("职位"),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                        textAlign: TextAlign.end,
                      )),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  indent: 10,
                  endIndent: 10,
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget _buildBottomPicker(
  Widget picker,
  BuildContext context,
  UserEditState state,
  Dispatch dispatch,
) {
  return Container(
    height: 250,
    color: CupertinoColors.white,
    child: Stack(
      children: <Widget>[
        Container(
          height: 220,
          margin: EdgeInsets.only(top: 30),
          child: DefaultTextStyle(
            style: const TextStyle(
              color: CupertinoColors.black,
              fontSize: 22.0,
            ),
            child: GestureDetector(
              // Blocks taps from propagating to the modal sheet and popping.
              onTap: () {},
              child: SafeArea(
                top: false,
                child: picker,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("取消"),
            ),
            RaisedButton(
              onPressed: () {
                var formatDate = DateUtil.formatDate(state.selectDateTime,
                    format: DataFormats.y_mo_d);
                Navigator.pop(context);
//                dispatch(
//                  UserEditActionCreator.updateUserInfo(
//                    getuserInfo(
//                      formatDate,
//                      state.userInfoItem.guid,
//                      4,
//                    ),
//                  ),
//                );
              },
              child: Text("确定"),
            ),
          ],
        ),
      ],
    ),
  );
}

/**
 * type 1:更换头像 2：性别
 */
showBottomDialog(
    UserEditState state, Dispatch dispatch, ViewService viewService, int type) {
  showModalBottomSheet(
    context: viewService.context,
    builder: (BuildContext context) {
      List<Widget> list;
      if (type == 1) {
        list = getListTitles(context, dispatch);
      } else if (type == 2) {
        list = getListTitles_sex(state, context, dispatch);
      }
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    },
  );
}

List<Widget> getListTitles_sex(
    UserEditState state, BuildContext context, dispatch) {
  List<Widget> list = [
    ListTile(
      title: new Text("男"),
      onTap: () async {
        Navigator.pop(context);
        dispatch(
          UserEditActionCreator.updateUserInfo(
            getuserInfo(
              1,
              null,
              1,
            ),
          ),
        );
      },
    ),
    ListTile(
      title: new Text("女"),
      onTap: () async {
        Navigator.pop(context);
        dispatch(
          UserEditActionCreator.updateUserInfo(
            getuserInfo(
              2,
              null,
              1,
            ),
          ),
        );
      },
    ),
  ];
  return list;
}

getListTitles(BuildContext context, Dispatch dispatch) {
  List<Widget> list = [
    ListTile(
      leading: new Icon(Icons.photo_camera),
      title: new Text("照相"),
      onTap: () async {
        Navigator.pop(context);
        dispatch(UserEditActionCreator.choiceHeadPhoto(ImageSource.camera));
      },
    ),
    ListTile(
      leading: new Icon(Icons.photo_library),
      title: new Text("相册"),
      onTap: () async {
        Navigator.pop(context);
        dispatch(UserEditActionCreator.choiceHeadPhoto(ImageSource.gallery));
      },
    ),
  ];
  return list;
}

/**
 * type  1.性别
 */
getuserInfo(int value, String des, int type) {
  ReqUpdateUserinfoEntity userInfo;
  if (type == 1) {
    userInfo = ReqUpdateUserinfoEntity(
        updateData: ReqUpdateUserinfoUpdateData(gender: value));
  }
  return userInfo;
}
