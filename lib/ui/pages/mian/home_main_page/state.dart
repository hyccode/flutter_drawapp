import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yubeiapp/global_store/state.dart';
import 'package:yubeiapp/ui/pages/goodslist/state.dart';

import 'banner_component/state.dart';
import 'component_study_task/state.dart';

class HomeMainState implements GlobalBaseState<HomeMainState> {
  RefreshController refreshController;

  ScrollController controller;
  Color titleBackgroundColor;
  int titleBackgroundColor_alpha;
  List<BannerModel> advertDetailsList;
  List<ItemHomeModel> squareByStatusList;

  @override
  HomeMainState clone() {
    return HomeMainState()
      ..controller = controller
      ..themeColor = themeColor
      ..titleBackgroundColor_alpha = titleBackgroundColor_alpha
      ..advertDetailsList = advertDetailsList
      ..squareByStatusList = squareByStatusList
      ..refreshController = refreshController
      ..titleBackgroundColor = titleBackgroundColor;
  }

  @override
  Color themeColor;
}

HomeMainState initState(Map<String, dynamic> args) {
  return HomeMainState()
    ..refreshController = RefreshController(initialRefresh: false)
    ..controller = new ScrollController()
    ..titleBackgroundColor_alpha = 255
    ..titleBackgroundColor = Color.fromARGB(255, 4, 55, 150)
    ..advertDetailsList = [
      BannerModel(title: ""),
      BannerModel(title: ""),
      BannerModel(title: ""),
    ]
    ..squareByStatusList = [
      ItemHomeModel(title: "第一个",messageList: [GoodsListModel(title: ""),GoodsListModel(title: ""),GoodsListModel(title: ""),GoodsListModel(title: ""),]),
      ItemHomeModel(title: "第二个",messageList: [GoodsListModel(title: ""),GoodsListModel(title: ""),GoodsListModel(title: ""),GoodsListModel(title: ""),]),
      ItemHomeModel(title: "第三个",messageList: [GoodsListModel(title: ""),GoodsListModel(title: ""),GoodsListModel(title: ""),GoodsListModel(title: ""),]),
    ];
}

class BannerConnector
    extends Reselect1<HomeMainState, BannerState, List<BannerModel>> {
  @override
  BannerState computed(List<BannerModel> sub0) {
    return BannerState()
      ..advertDetailsList = sub0
      ..customLayoutOption =
          new CustomLayoutOption(startIndex: -1, stateCount: 3)
              .addRotate([-25.0 / 180, 0.0, 25.0 / 180]).addTranslate([
        new Offset(-350.0, 0.0),
        new Offset(0.0, 0.0),
        new Offset(350.0, 0.0)
      ])
      ..curve = Curves.ease
      ..controller = new SwiperController()
      ..layout = SwiperLayout.DEFAULT
      ..loop = true
      ..autoplay = true
      ..autoplayDely = 3000
      ..outer = false
      ..scrollDirection = Axis.horizontal;
  }

  @override
  List<BannerModel> getSub0(HomeMainState state) {
    return state.advertDetailsList;
  }

  @override
  void set(HomeMainState state, BannerState subState) {
    state.advertDetailsList = subState.advertDetailsList;
  }
}

class StudyTaskConnector extends ConnOp<HomeMainState, StudyTaskState> {
  @override
  StudyTaskState get(HomeMainState state) {
    return initStudyTaskState(null);
  }

  @override
  void set(HomeMainState state, StudyTaskState subState) {}
}

class BannerModel {
  String title;

  BannerModel({
    this.title,
  });
}

class ItemHomeModel {
  String title;
  List<GoodsListModel> messageList;

  ItemHomeModel({this.title, this.messageList});
}
