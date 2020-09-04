class Api {
  /// 获取access_token
  static const String TOKEN = "token";
  /// 注册
  static const String REGISTER = "xe.user.register/1.0.0";
  /// 获取用户信息
  static const String GET_USERINFO = "xe.user.info.get/1.0.0";
  /// 更新用户信息
  static const String UPDATE_USERINFO = "xe.user.info.update/1.0.0";
  /// 拉取专栏的资源列表
  static const String GOODS_RELATION = "xe.goods.relation.get/3.0.0";


  static String getPath({String path: '', int page, String resType: 'json'}) {
    StringBuffer sb = new StringBuffer(path);
    if (page != null) {
      sb.write('/$page');
    }
    if (resType != null && resType.isNotEmpty) {
      sb.write('/$resType');
    }
    return sb.toString();
  }
}
