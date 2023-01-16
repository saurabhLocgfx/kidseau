class AttendanceSearchKidsModel {
  int? status;
  List<SerchKid>? serchKid;

  AttendanceSearchKidsModel({this.status, this.serchKid});

  AttendanceSearchKidsModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    if (json['serchKid'] != null) {
      serchKid = <SerchKid>[];
      json['serchKid'].forEach((v) {
        serchKid!.add(new SerchKid.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    if (this.serchKid != null) {
      data['serchKid'] = this.serchKid!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SerchKid {
  String? kidId;
  String? name;
  String? profilePic;
  String? fatherName;

  SerchKid({this.kidId, this.name, this.profilePic, this.fatherName});

  SerchKid.fromJson(Map<String, dynamic> json) {
    kidId = json['kid_id'];
    name = json['name'];
    profilePic = json['profile_pic'];
    fatherName = json['father_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kid_id'] = this.kidId;
    data['name'] = this.name;
    data['profile_pic'] = this.profilePic;
    data['father_name'] = this.fatherName;
    return data;
  }
}