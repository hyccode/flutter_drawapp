class ReqUserinfoEntity {
  String wxUnionId;
  List<String> fieldList;

  ReqUserinfoEntity({this.wxUnionId, this.fieldList});

  ReqUserinfoEntity.fromJson(Map<String, dynamic> json) {
    wxUnionId = json['wx_union_id'];
    fieldList = json['field_list']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wx_union_id'] = this.wxUnionId;
    data['field_list'] = this.fieldList;
    return data;
  }
}
