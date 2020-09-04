import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:yubeiapp/data/protocol/icon_name_model.dart';

class StudyTaskState implements Cloneable<StudyTaskState> {
  List<IconNameModel> studyTask;

  @override
  StudyTaskState clone() {
    return StudyTaskState()..studyTask = studyTask;
  }
}

StudyTaskState initStudyTaskState(Map<String, dynamic> args) {
  final List<IconNameModel> initToDos = <IconNameModel>[
    IconNameModel(
      name: '母婴视频',
      icon: Icons.video_library,
    ),
    IconNameModel(
      name: '读书汇',
      icon: Icons.book,
    ),
    IconNameModel(
      name: '幼儿教育',
      icon: Icons.person,
    ),
    IconNameModel(
      name: '名师专栏',
      icon: Icons.beach_access,
    ),
  ];
  return StudyTaskState()..studyTask = initToDos;
}
