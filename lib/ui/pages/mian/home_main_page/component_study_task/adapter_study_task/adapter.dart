import 'package:fish_redux/fish_redux.dart';
import 'package:yubeiapp/data/protocol/icon_name_model.dart';

import '../state.dart';
import 'effect.dart';
import 'item_study_task.dart';

class StudyTaskAdapter extends DynamicFlowAdapter<StudyTaskState> {
  StudyTaskAdapter()
      : super(
          effect: buildEffect(),
          pool: <String, Component<Object>>{
            "studyTask": ItemStudyTaskComponent(),
          },
          connector: _StudyTaskConnector(),
        );
}

class _StudyTaskConnector extends ConnOp<StudyTaskState, List<ItemBean>> {
  @override
  List<ItemBean> get(StudyTaskState state) {
    if (state.studyTask?.isNotEmpty == true) {
      List<ItemBean> items = [];
      for (var iconNameModel in state.studyTask) {
        items.add(ItemBean('studyTask', iconNameModel));
      }
      return items;
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(StudyTaskState state, List<ItemBean> items) {
    if (items?.isNotEmpty == true) {
      state.studyTask = List<IconNameModel>.from(
          items.map<IconNameModel>((ItemBean bean) => bean.data).toList());
    } else {
      state.studyTask = <IconNameModel>[];
    }
  }

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
