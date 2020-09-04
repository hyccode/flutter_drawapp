import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:yubeiapp/global_store/state.dart';

class HomeMessageState implements GlobalBaseState<HomeMessageState> {
  List<MessageModel> messageList;
  @override
  HomeMessageState clone() {
    return HomeMessageState()
      ..themeColor = themeColor
      ..messageList = messageList;
  }

  @override
  Color themeColor;
}

HomeMessageState initState(Map<String, dynamic> args) {
  final List<MessageModel> initToDos = <MessageModel>[
    MessageModel(
      title: '第一条消息',
    ),
    MessageModel(
      title: '第二条消息',
    ),
    MessageModel(
      title: '第三条消息',
    ),
  ];
  return HomeMessageState()..messageList = initToDos;
}



class MessageModel {
  String title;

  MessageModel({
    this.title,
  });
}
