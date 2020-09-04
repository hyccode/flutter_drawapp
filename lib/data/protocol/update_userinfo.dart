class UpdateUserInfo {
  String userId;
  String babyName;
  String babySex;
  String grade;
  String parentName;
  String appellation;
  String babyBirthday;
  String userImg;

  UpdateUserInfo({this.userId, this.babyName, this.babySex, this.grade,this.parentName,this.appellation
  ,this.babyBirthday,this.userImg});

  UpdateUserInfo.fromJson(Map<String, dynamic> json) {
    grade = json['userId'];
    babyName = json['babyName'];
    babySex = json['babySex'];
    grade = json['grade'];
    parentName = json['parentName'];
    appellation = json['appellation'];
    babyBirthday = json['babyBirthday'];
    userImg = json['userImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['babyName'] = this.babyName;
    data['babySex'] = this.babySex;
    data['grade'] = this.grade;
    data['parentName'] = this.parentName;
    data['appellation'] = this.appellation;
    data['babyBirthday'] = this.babyBirthday;
    data['userImg'] = this.userImg;
    return data;
  }
}
