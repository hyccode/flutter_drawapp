import 'package:fish_redux/fish_redux.dart';
import '../state.dart';
import 'action.dart';

Effect<StudyTaskState> buildEffect() {
  return combineEffects(<Object, Effect<StudyTaskState>>{
    StudyTaskAction.action: _onAction,
  });
}

void _onAction(Action action, Context<StudyTaskState> ctx) {
}
