/// 请求基类
class BaseReq {
  String accessToken;
  String userId;
  Map<String, dynamic> data;

  BaseReq(this.accessToken, {this.data, this.userId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['data'] = this.data;
    data['user_id'] = this.userId;
    return data;
  }
}
