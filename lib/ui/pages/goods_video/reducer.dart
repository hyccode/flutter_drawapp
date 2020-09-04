import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GoodsVideoState> buildReducer() {
  return asReducer(
    <Object, Reducer<GoodsVideoState>>{
      GoodsVideoAction.action: _onAction,
      GoodsVideoAction.play: _onPlay,
      GoodsVideoAction.pause: _onPause,
      GoodsVideoAction.playOrPause: _onPlayOrPause,
    },
  );
}

GoodsVideoState _onAction(GoodsVideoState state, Action action) {
  final GoodsVideoState newState = state.clone();
  return newState;
}

GoodsVideoState _onPlay(GoodsVideoState state, Action action) {
  final GoodsVideoState newState = state.clone();
  newState.controller.play();
  return newState;
}

GoodsVideoState _onPause(GoodsVideoState state, Action action) {
  final GoodsVideoState newState = state.clone();
  return newState;
}

GoodsVideoState _onPlayOrPause(GoodsVideoState state, Action action) {
  final GoodsVideoState newState = state.clone();
  newState.controller.value.isPlaying
      ? newState.controller.pause()
      : newState.controller.play();
  return newState;
}
