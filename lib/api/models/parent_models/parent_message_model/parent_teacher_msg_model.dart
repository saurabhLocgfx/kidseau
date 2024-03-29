class ParentMsgTeacherModel {
  int? status;
  List<AllTeahcer>? allTeahcer;

  ParentMsgTeacherModel({this.status, this.allTeahcer});

  ParentMsgTeacherModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['allTeahcer'] != null) {
      allTeahcer = <AllTeahcer>[];
      json['allTeahcer'].forEach((v) {
        allTeahcer!.add(new AllTeahcer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.allTeahcer != null) {
      data['allTeahcer'] = this.allTeahcer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllTeahcer {
  String? teacherId;
  String? fName;
  String? familyName;
  String? techProfile;
  String? langId;
  String? userType;

  AllTeahcer(
      {this.teacherId,
      this.fName,
      this.userType,
      this.familyName,
      this.techProfile,
      this.langId});

  AllTeahcer.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    fName = json['f_name'];
    userType = json['user_type'];
    familyName = json['family_name'];
    techProfile = json['tech_profile'];
    langId = json['lang_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teacher_id'] = this.teacherId;
    data['f_name'] = this.fName;
    data['user_type'] = this.userType;
    data['family_name'] = this.familyName;
    data['tech_profile'] = this.techProfile;
    data['lang_id'] = this.langId;
    return data;
  }
}
