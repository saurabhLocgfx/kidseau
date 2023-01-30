class PSchoolGroupDetailModel {
  int? status;
  List<GroupWithSection>? groupWithSection;

  PSchoolGroupDetailModel({this.status, this.groupWithSection});

  PSchoolGroupDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['groupWithSection'] != null) {
      groupWithSection = <GroupWithSection>[];
      json['groupWithSection'].forEach((v) {
        groupWithSection!.add(new GroupWithSection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.groupWithSection != null) {
      data['groupWithSection'] =
          this.groupWithSection!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroupWithSection {
  String? grpId;
  String? grpName;

  GroupWithSection({this.grpId, this.grpName});

  GroupWithSection.fromJson(Map<String, dynamic> json) {
    grpId = json['grp_id'];
    grpName = json['grp_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grp_id'] = this.grpId;
    data['grp_name'] = this.grpName;
    return data;
  }
}
