class TeacherGroupsModel {
  int? status;
  List<GroupInCard>? groupInCard;

  TeacherGroupsModel({this.status, this.groupInCard});

  TeacherGroupsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['groupInCard'] != null) {
      groupInCard = <GroupInCard>[];
      json['groupInCard'].forEach((v) {
        groupInCard!.add(new GroupInCard.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.groupInCard != null) {
      data['groupInCard'] = this.groupInCard!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroupInCard {
  String? grpId;
  String? groupName;

  GroupInCard({this.grpId, this.groupName});

  GroupInCard.fromJson(Map<String, dynamic> json) {
    grpId = json['grp_id'];
    groupName = json['group_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grp_id'] = this.grpId;
    data['group_name'] = this.groupName;
    return data;
  }
}