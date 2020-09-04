import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  //开启log
  LogUtil.init(isDebug: true, tag: "dayutang");
  runApp(createApp());
}