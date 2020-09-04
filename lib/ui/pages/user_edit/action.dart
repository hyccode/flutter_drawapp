import 'package:fish_redux/fish_redux.dart';
import 'package:image_picker/image_picker.dart';

//TODO replace with your own action
enum UserEditAction { action, showUserHead, choiceHeadPhoto, updateUserInfo}

class UserEditActionCreator {
  static Action onAction() {
    return const Action(UserEditAction.action);
  }

  static Action showUserInfo(item) {
    return Action(UserEditAction.showUserHead, payload: item);
  }


  static Action choiceHeadPhoto(ImageSource source) {
    return Action(UserEditAction.choiceHeadPhoto, payload: source);
  }

  static Action updateUserInfo(item) {
    return Action(UserEditAction.updateUserInfo, payload: item);
  }

}
