import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:yubeiapp/ui/pages/mian/home_main_page/state.dart';

class BannerState implements Cloneable<BannerState> {
  List<BannerModel> advertDetailsList;

  SwiperController controller;

  int currentIndex;

  bool loop;

  bool autoplay;

  int autoplayDely;

  bool outer;

  SwiperLayout layout;

  Axis scrollDirection;

  Curve curve;

  CustomLayoutOption customLayoutOption;

  @override
  BannerState clone() {
    return BannerState()..advertDetailsList = advertDetailsList;
  }

  Widget buildItem(BuildContext context, int index) {
    return Container(
      color: Color.fromARGB(255, 209, 51, 45),
      height: 150,
      child: CachedNetworkImage(
        imageUrl: advertDetailsList[index].title,
        errorWidget: (context, url, error) => Icon(Icons.error),
        placeholder: (context, url) => new Container(
          child: new Center(
            child: new CircularProgressIndicator(),
          ),
          width: 90.0,
          height: 90.0,
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}
