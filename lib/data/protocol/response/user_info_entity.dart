class UserInfoEntity {
  String appId;
  String userId;
  String wxUnionId;
  String name;
  String nickname;
  String avatar;
  String wxAvatar;
  String email;

  //0-无 1-男 2-女
  int gender;
  String language;
  String city;
  String province;
  String country;
  int age;
  String birth;
  String phone;
  String address;
  String job;
  String company;
  String industry;
  String tags;
  String wxAccount;
  String phoneCollect;

  UserInfoEntity({this.appId, this.userId});

  UserInfoEntity.fromJson(Map<String, dynamic> json) {
    appId = json['app_id'];
    userId = json['user_id'];
    wxUnionId = json['wx_union_id'];
    name = json['name'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    wxAvatar = json['wx_avatar'];
    email = json['email'];
    gender = json['gender'];
    language = json['language'];
    age = json['age'];
    city = json['city'];
    province = json['province'];
    country = json['country'];
    birth = json['birth'];
    phone = json['phone'];
    address = json['address'];
    job = json['job'];
    company = json['company'];
    industry = json['industry'];
    tags = json['tags'];
    wxAccount = json['wx_account'];
    phoneCollect = json['phone_collect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_id'] = this.appId;
    data['user_id'] = this.userId;
    data['wx_union_id'] = this.wxUnionId;
    data['name'] = this.name;
    data['nickname'] = this.nickname;
    data['avatar'] = this.avatar;
    data['wx_avatar'] = this.wxAvatar;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['language'] = this.language;
    data['age'] = this.age;
    data['city'] = this.city;
    data['province'] = this.province;
    data['country'] = this.country;
    data['birth'] = this.birth;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['job'] = this.job;
    data['company'] = this.company;
    data['industry'] = this.industry;
    data['tags'] = this.tags;
    data['wx_account'] = this.wxAccount;
    data['phone_collect'] = this.phoneCollect;
    return data;
  }
}
