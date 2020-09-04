class ReqUpdateUserinfoEntity {
	ReqUpdateUserinfoUpdateData updateData;

	ReqUpdateUserinfoEntity({this.updateData});

	ReqUpdateUserinfoEntity.fromJson(Map<String, dynamic> json) {
		updateData = json['update_data'] != null ? new ReqUpdateUserinfoUpdateData.fromJson(json['update_data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.updateData != null) {
      data['update_data'] = this.updateData.toJson();
    }
		return data;
	}
}

class ReqUpdateUserinfoUpdateData {
	String nickname;
	String avatar;
	int gender;
  String name;
  int age;

	ReqUpdateUserinfoUpdateData({this.nickname,this.avatar,this.gender,this.name,this.age});

	ReqUpdateUserinfoUpdateData.fromJson(Map<String, dynamic> json) {
		nickname = json['nickname'];
		avatar = json['avatar'];
		gender = json['gender'];
		name = json['name'];
		age = json['age'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['nickname'] = this.nickname;
		data['avatar'] = this.avatar;
		data['gender'] = this.gender;
		data['name'] = this.name;
		data['age'] = this.age;
		return data;
	}
}
