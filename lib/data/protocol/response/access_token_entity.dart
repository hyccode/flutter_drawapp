class AccessTokenEntity {
	String accessToken;
	int expiresIn;

	AccessTokenEntity({this.accessToken, this.expiresIn});

	AccessTokenEntity.fromJson(Map<String, dynamic> json) {
		accessToken = json['access_token'];
		expiresIn = json['expires_in'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['access_token'] = this.accessToken;
		data['expires_in'] = this.expiresIn;
		return data;
	}
}
