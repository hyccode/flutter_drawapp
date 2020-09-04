import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SearchResultAction { action }

class SearchResultActionCreator {
  static Action onAction() {
    return const Action(SearchResultAction.action);
  }
}
