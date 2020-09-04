class ReqRegisterEntity {
  String wxUnionId;
  String phone;
  String avatar;
  String nickname;
  int gender;
  String city;
  String province;
  String country;

  ReqRegisterEntity({
    this.wxUnionId,
    this.phone,
    this.avatar,
    this.nickname,
    this.gender,
    this.city,
    this.province,
    this.country,
  });

  ReqRegisterEntity.fromJson(Map<String, dynamic> json) {
    wxUnionId = json['wx_union_id'];
    phone = json['phone'];
    avatar = json['avatar'];
    nickname = json['nickname'];
    gender = json['gender'];
    city = json['city'];
    province = json['province'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wx_union_id'] = this.wxUnionId;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['nickname'] = this.nickname;
    data['gender'] = this.gender;
    data['city'] = this.city;
    data['province'] = this.province;
    data['country'] = this.country;
    return data;
  }
}
