import 'package:yubeiapp/data/protocol/response/register_entity.dart';
import 'package:yubeiapp/data/protocol/response/user_info_entity.dart';
import 'package:yubeiapp/data/protocol/response/access_token_entity.dart';
import 'package:yubeiapp/data/protocol/request/req_userinfo_entity.dart';
import 'package:yubeiapp/data/protocol/request/req_register_entity.dart';
import 'package:yubeiapp/data/protocol/request/req_update_userinfo_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "RegisterEntity") {
      return RegisterEntity.fromJson(json) as T;
    } else if (T.toString() == "UserInfoEntity") {
      return UserInfoEntity.fromJson(json) as T;
    } else if (T.toString() == "AccessTokenEntity") {
      return AccessTokenEntity.fromJson(json) as T;
    } else if (T.toString() == "ReqUserinfoEntity") {
      return ReqUserinfoEntity.fromJson(json) as T;
    } else if (T.toString() == "ReqRegisterEntity") {
      return ReqRegisterEntity.fromJson(json) as T;
    } else if (T.toString() == "ReqUpdateUserinfoEntity") {
      return ReqUpdateUserinfoEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}