import 'package:rxdart/rxdart.dart';
import 'package:yubeiapp/data/api/apis.dart';
import 'package:yubeiapp/data/net/dio_util.dart';
import 'package:yubeiapp/data/protocol/request/req_register_entity.dart';
import 'package:yubeiapp/data/protocol/request/req_update_userinfo_entity.dart';
import 'package:yubeiapp/data/protocol/request/req_userinfo_entity.dart';

class Repository {
  /*
  * 获取access_token
  * */
  static Observable getToken<T>() {
    Map<String, String> map = new Map();
    map["app_id"] = "appXaDBHn4E5888";
    map["secret_key"] = "Hqf3YUu6OGo5t7CabahAdm5ncHYto4Ex";
    map["grant_type"] = "client_credential";
    return DioUtil.getInstance().get<T>(Api.TOKEN, params: map);
  }

  /*
  * 注册
  * */
  static Observable register<T>(String wxUnionId) {
    var req = ReqRegisterEntity(
      wxUnionId: wxUnionId,
    ).toJson();

    return DioUtil.getInstance().post<T>(Api.REGISTER, params: req);
  }

  /*
  * 获取用户信息
  * */
  static Observable getUserInfo<T>(String wxUnionId) {
    var reqUserinfoEntity =
        ReqUserinfoEntity(wxUnionId: wxUnionId, fieldList: ["name", "nickname"])
            .toJson();

    return DioUtil.getInstance()
        .post<T>(Api.GET_USERINFO, params: reqUserinfoEntity);
  }

  /*
  * 更新用户信息
  * */
  static Observable updateUserInfo<T>(
      ReqUpdateUserinfoEntity reqUpdateUserinfoEntity) {
    return DioUtil.getInstance()
        .post<T>(Api.UPDATE_USERINFO, params: reqUpdateUserinfoEntity.toJson());
  }

  /*
  * 拉取专栏的资源列表
  * */
  static Observable goodsRelation<T>() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['goods_id'] = "p_5ce266c468fb6_SaQRt3Ka";
    data['goods_type'] = 8;
    data['resource_type'] = [6];
    data['last_id'] = "";
    data['page_size'] = [20];

    return DioUtil.getInstance().post<T>(Api.GOODS_RELATION, params: data);
  }
}
