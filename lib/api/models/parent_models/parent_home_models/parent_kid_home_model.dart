class ParentKidHomeModel {
  int? status;
  List<ParentKidId>? parentKidId;

  ParentKidHomeModel({this.status, this.parentKidId});

  ParentKidHomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['parent_kid_id'] != null) {
      parentKidId = <ParentKidId>[];
      json['parent_kid_id'].forEach((v) {
        parentKidId!.add(new ParentKidId.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.parentKidId != null) {
      data['parent_kid_id'] = this.parentKidId!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ParentKidId {
  String? kidId;
  String? name;
  String? grpId;
  String? grpName;
  String? profilePic;
  String? secName;
  String? schTimeIn;
  String? schTimeOut;

  ParentKidId(
      {this.kidId,
      this.name,
      this.grpId,
      this.grpName,
      this.profilePic,
      this.secName,
      this.schTimeIn,
      this.schTimeOut});

  ParentKidId.fromJson(Map<String, dynamic> json) {
    kidId = json['kid_id'];
    name = json['name'];
    grpName = json['grp_name'];
    grpId = json['grp_id'];
    profilePic = json['profile_pic'];
    secName = json['sec_name'];
    schTimeIn = json['sch_time_in'];
    schTimeOut = json['sch_time_out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kid_id'] = this.kidId;
    data['name'] = this.name;
    data['grp_id'] = this.grpId;
    data['grp_name'] = this.grpName;
    data['profile_pic'] = this.profilePic;
    data['sec_name'] = this.secName;
    data['sch_time_in'] = this.schTimeIn;
    data['sch_time_out'] = this.schTimeOut;
    return data;
  }
}
