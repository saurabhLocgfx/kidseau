class GroupResponse {
  GroupResponse({
    required this.Status,
    required this.Group,
  });
  late final String Status;
  late final List<Group1> Group;

  GroupResponse.fromJson(Map<String, dynamic> json) {
    Status = json['Status'];
    Group = List.from(json['Group']).map((e) => Group1.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Status'] = Status;
    _data['Group'] = Group.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Group1 {
  Group1({
    required this.grpId,
    required this.grpName,
  });
  late final String grpId;
  late final String grpName;

  Group1.fromJson(Map<String, dynamic> json) {
    grpId = json['grp_id'];
    grpName = json['grp_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['grp_id'] = grpId;
    _data['grp_name'] = grpName;
    return _data;
  }
}
