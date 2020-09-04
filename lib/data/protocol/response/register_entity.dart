class RegisterEntity {
	String userId;

	RegisterEntity({this.userId});

	RegisterEntity.fromJson(Map<String, dynamic> json) {
		userId = json['user_id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['user_id'] = this.userId;
		return data;
	}
}
