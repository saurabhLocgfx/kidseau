class ParentPostSchoolModel {
  int? status;
  List<KidSch>? kidSch;

  ParentPostSchoolModel({this.status, this.kidSch});

  ParentPostSchoolModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['kid_sch'] != null) {
      kidSch = <KidSch>[];
      json['kid_sch'].forEach((v) {
        kidSch!.add(new KidSch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.kidSch != null) {
      data['kid_sch'] = this.kidSch!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KidSch {
  String? secId;
  String? grpId;
  String? groupName;
  String? schId;
  String? schoolName;

  KidSch({this.secId, this.grpId, this.groupName, this.schId, this.schoolName});

  KidSch.fromJson(Map<String, dynamic> json) {
    secId = json['sec_id'];
    grpId = json['grp_id'];
    groupName = json['group_name'];
    schId = json['sch_id'];
    schoolName = json['school_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sec_id'] = this.secId;
    data['grp_id'] = this.grpId;
    data['group_name'] = this.groupName;
    data['sch_id'] = this.schId;
    data['school_name'] = this.schoolName;
    return data;
  }
}
