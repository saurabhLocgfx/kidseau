class TeacherAllAttendanceModel {
  int? status;
  List<GroupAllkid>? groupAllkid;

  TeacherAllAttendanceModel({this.status, this.groupAllkid});

  TeacherAllAttendanceModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    if (json['groupAllkid '] != null) {
      groupAllkid = <GroupAllkid>[];
      json['groupAllkid '].forEach((v) {
        groupAllkid!.add(new GroupAllkid.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    if (this.groupAllkid != null) {
      data['groupAllkid '] = this.groupAllkid!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroupAllkid {
  String? kidId;
  String? name;
  String? gender;
  String? profilePic;
  String? parentId;
  String? father;
  String? status;

  GroupAllkid(
      {this.kidId,
        this.name,
        this.gender,
        this.profilePic,
        this.parentId,
        this.father,
        this.status});

  GroupAllkid.fromJson(Map<String, dynamic> json) {
    kidId = json['kid_id'];
    name = json['name'];
    gender = json['gender'];
    profilePic = json['profile_pic'];
    parentId = json['parent_id'];
    father = json['father'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kid_id'] = this.kidId;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['profile_pic'] = this.profilePic;
    data['parent_id'] = this.parentId;
    data['father'] = this.father;
    data['status'] = this.status;
    return data;
  }
}