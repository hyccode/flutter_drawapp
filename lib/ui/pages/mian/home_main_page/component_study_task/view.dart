import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    StudyTaskState state, Dispatch dispatch, ViewService viewService) {
  var buildAdapter = viewService.buildAdapter();
  return Container(
    child: Column(
      children: <Widget>[
        GridView.builder(
          shrinkWrap: true,
          physics: new NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: buildAdapter.itemBuilder,
          itemCount: buildAdapter.itemCount,
        )
      ],
    ),
  );
}
