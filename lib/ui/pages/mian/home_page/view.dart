import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:yubeiapp/ui/pages/mian/home_page/state.dart';

import 'action.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return new Scaffold(
    bottomNavigationBar: BottomNavigationBar(
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.green,
      currentIndex: state.currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        dispatch(HomeActionCreator.jumpToPage(index));
      },
      items: state.listView,
    ),
    body: PageView(
      controller: state.controller,
      onPageChanged: (index) {
        Future.delayed(const Duration(milliseconds: 1), () {
          dispatch(HomeActionCreator.changePage(index));
        });
      },
      children: state.bodys,
    ),
  );
}
