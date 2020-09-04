import 'package:fish_redux/fish_redux.dart';

import 'adapter_study_task/adapter.dart';
import 'effect.dart';
import 'state.dart';
import 'view.dart';

class StudyTaskComponent extends Component<StudyTaskState> {
  StudyTaskComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
          dependencies: Dependencies<StudyTaskState>(
              adapter: NoneConn<StudyTaskState>() +StudyTaskAdapter(), slots: <String, Dependent<StudyTaskState>>{}),
        );
}
