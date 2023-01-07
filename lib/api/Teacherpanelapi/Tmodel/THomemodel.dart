class THomeModel {
  int? status;
  String? hello;
  List<GroupInCard>? groupInCard;
  List<Schdule>? schdule;
  List<Attendance>? attendance;

  THomeModel(
      {this.status,
        this.hello,
        this.groupInCard,
        this.schdule,
        this.attendance});

  THomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    hello = json['Hello'];
    if (json['groupInCard'] != null) {
      groupInCard = <GroupInCard>[];
      json['groupInCard'].forEach((v) {
        groupInCard!.add(new GroupInCard.fromJson(v));
      });
    }
    if (json['Schdule'] != null) {
      schdule = <Schdule>[];
      json['Schdule'].forEach((v) {
        schdule!.add(new Schdule.fromJson(v));
      });
    }
    if (json['attendance'] != null) {
      attendance = <Attendance>[];
      json['attendance'].forEach((v) {
        attendance!.add(new Attendance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Hello'] = this.hello;
    if (this.groupInCard != null) {
      data['groupInCard'] = this.groupInCard!.map((v) => v.toJson()).toList();
    }
    if (this.schdule != null) {
      data['Schdule'] = this.schdule!.map((v) => v.toJson()).toList();
    }
    if (this.attendance != null) {
      data['attendance'] = this.attendance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroupInCard {
  String? grpId;
  String? grpName;
  String? grpImage;
  String? secName;
  String? allKid;

  GroupInCard(
      {this.grpId, this.grpName, this.grpImage, this.secName, this.allKid});

  GroupInCard.fromJson(Map<String, dynamic> json) {
    grpId = json['grp_id'];
    grpName = json['grp_name'];
    grpImage = json['grp_image'];
    secName = json['sec_name'];
    allKid = json['allKid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grp_id'] = this.grpId;
    data['grp_name'] = this.grpName;
    data['grp_image'] = this.grpImage;
    data['sec_name'] = this.secName;
    data['allKid'] = this.allKid;
    return data;
  }
}

class Schdule {
  String? actTitle;
  String? actIcon;
  String? sun;
  String? timing;
  String? grpName;

  Schdule({this.actTitle, this.actIcon, this.sun, this.timing, this.grpName});

  Schdule.fromJson(Map<String, dynamic> json) {
    actTitle = json['act_title'];
    actIcon = json['act_icon'];
    sun = json['sun'];
    timing = json['timing'];
    grpName = json['grp_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['act_title'] = this.actTitle;
    data['act_icon'] = this.actIcon;
    data['sun'] = this.sun;
    data['timing'] = this.timing;
    data['grp_name'] = this.grpName;
    return data;
  }
}

class Attendance {
  String? groupId;
  String? groupImage;
  String? groupName;
  String? sectionName;
  int? totalStudent;
  int? studentPresent;

  Attendance(
      {this.groupId,
        this.groupImage,
        this.groupName,
        this.sectionName,
        this.totalStudent,
        this.studentPresent});

  Attendance.fromJson(Map<String, dynamic> json) {
    groupId = json['groupId'];
    groupImage = json['groupImage'];
    groupName = json['groupName'];
    sectionName = json['sectionName'];
    totalStudent = json['totalStudent'];
    studentPresent = json['studentPresent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupId'] = this.groupId;
    data['groupImage'] = this.groupImage;
    data['groupName'] = this.groupName;
    data['sectionName'] = this.sectionName;
    data['totalStudent'] = this.totalStudent;
    data['studentPresent'] = this.studentPresent;
    return data;
  }
}