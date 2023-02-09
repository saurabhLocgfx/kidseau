class EditStudentPerformanceModel {
  int? status;
  String? kidId;
  String? kidName;
  String? kidImage;
  String? kidFather;
  int? kidAge;
  List<PfmRate>? pfmRate;

  EditStudentPerformanceModel(
      {this.status,
      this.kidId,
      this.kidName,
      this.kidImage,
      this.kidFather,
      this.kidAge,
      this.pfmRate});

  EditStudentPerformanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    kidId = json['kidId'];
    kidName = json['kidName'];
    kidImage = json['kidImage'];
    kidFather = json['kidFather'];
    kidAge = json['kidAge'];
    if (json['pfm_rate'] != null) {
      pfmRate = <PfmRate>[];
      json['pfm_rate'].forEach((v) {
        pfmRate!.add(new PfmRate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['kidId'] = this.kidId;
    data['kidName'] = this.kidName;
    data['kidImage'] = this.kidImage;
    data['kidFather'] = this.kidFather;
    data['kidAge'] = this.kidAge;
    if (this.pfmRate != null) {
      data['pfm_rate'] = this.pfmRate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PfmRate {
  String? dayActId;
  String? actTitle;
  String? teacherName;
  String? pfmRate;

  PfmRate({this.dayActId, this.actTitle, this.teacherName, this.pfmRate});

  PfmRate.fromJson(Map<String, dynamic> json) {
    dayActId = json['day_act_id'];
    actTitle = json['actTitle'];
    teacherName = json['teacherName'];
    pfmRate = json['pfmRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day_act_id'] = this.dayActId;
    data['actTitle'] = this.actTitle;
    data['teacherName'] = this.teacherName;
    data['pfmRate'] = this.pfmRate;
    return data;
  }
}
