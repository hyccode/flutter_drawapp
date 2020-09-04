import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'view.dart';

class ItemMessageComponent extends Component<MessageModel> {
  ItemMessageComponent()
      : super(
          view: buildView,
        );
}
