class ParentProfileModel {
  int? status;
  String? info;
  String? parentId;
  String? parentImage;
  String? fatherName;
  String? foccupation;
  String? number;
  String? email;
  List<Kid>? kid;
  String? motherName;
  String? mOccupation;
  String? motherEmail;
  String? motherPhoneNumber;
  String? parentAddress;

  ParentProfileModel(
      {this.status,
      this.info,
      this.parentId,
      this.parentImage,
      this.fatherName,
      this.foccupation,
      this.number,
      this.email,
      this.kid,
      this.motherName,
      this.mOccupation,
      this.motherEmail,
      this.motherPhoneNumber,
      this.parentAddress});

  ParentProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    info = json['info'];
    parentId = json['parentId'];
    parentImage = json['parentImage'];
    fatherName = json['fatherName'];
    foccupation = json['foccupation'];
    number = json['number'];
    email = json['email'];
    if (json['kid'] != null) {
      kid = <Kid>[];
      json['kid'].forEach((v) {
        kid!.add(new Kid.fromJson(v));
      });
    }
    motherName = json['motherName'];
    mOccupation = json['mOccupation'];
    motherEmail = json['motherEmail'];
    motherPhoneNumber = json['motherPhoneNumber'];
    parentAddress = json['parentAddress '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['info'] = this.info;
    data['parentId'] = this.parentId;
    data['parentImage'] = this.parentImage;
    data['fatherName'] = this.fatherName;
    data['foccupation'] = this.foccupation;
    data['number'] = this.number;
    data['email'] = this.email;
    if (this.kid != null) {
      data['kid'] = this.kid!.map((v) => v.toJson()).toList();
    }
    data['motherName'] = this.motherName;
    data['mOccupation'] = this.mOccupation;
    data['motherEmail'] = this.motherEmail;
    data['motherPhoneNumber'] = this.motherPhoneNumber;
    data['parentAddress '] = this.parentAddress;
    return data;
  }
}

class Kid {
  String? kidId;
  String? name;
  String? profilePic;
  String? grpName;
  String? schTimeIn;
  String? schTimeOut;

  Kid(
      {this.kidId,
      this.name,
      this.profilePic,
      this.grpName,
      this.schTimeIn,
      this.schTimeOut});

  Kid.fromJson(Map<String, dynamic> json) {
    kidId = json['kid_id'];
    name = json['name'];
    profilePic = json['profile_pic'];
    grpName = json['grp_name'];
    schTimeIn = json['sch_time_in'];
    schTimeOut = json['sch_time_out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kid_id'] = this.kidId;
    data['name'] = this.name;
    data['profile_pic'] = this.profilePic;
    data['grp_name'] = this.grpName;
    data['sch_time_in'] = this.schTimeIn;
    data['sch_time_out'] = this.schTimeOut;
    return data;
  }
}
