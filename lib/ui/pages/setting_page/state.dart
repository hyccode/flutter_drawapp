import 'dart:ui';

import 'package:yubeiapp/global_store/state.dart';

class SettingState implements GlobalBaseState<SettingState> {
  @override
  SettingState clone() {
    return SettingState()..themeColor = themeColor;
  }

  @override
  Color themeColor;
}

SettingState initState(Map<String, dynamic> args) {
  return SettingState();
}
