import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum StudyTaskAction { action }

class StudyTaskActionCreator {
  static Action onAction() {
    return const Action(StudyTaskAction.action);
  }
}
