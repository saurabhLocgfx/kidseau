class StudentPerformanceModel {
  int? status;
  List<Performance>? performance;

  StudentPerformanceModel({this.status, this.performance});

  StudentPerformanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['performance'] != null) {
      performance = <Performance>[];
      json['performance'].forEach((v) {
        performance!.add(new Performance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.performance != null) {
      data['performance'] = this.performance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Performance {
  String? kidId;
  String? name;
  String? profilePic;
  String? fatherName;
  String? attendance;
  String? performanceRate;
  String? gender;

  Performance(
      {this.kidId,
      this.name,
      this.profilePic,
      this.fatherName,
      this.attendance,
      this.gender,
      this.performanceRate});

  Performance.fromJson(Map<String, dynamic> json) {
    kidId = json['kid_id'];
    name = json['name'];
    gender = json['gender'];
    profilePic = json['profile_pic'];
    fatherName = json['father_name'];
    attendance = json['attendance'];
    performanceRate = json['performance_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kid_id'] = this.kidId;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['profile_pic'] = this.profilePic;
    data['father_name'] = this.fatherName;
    data['attendance'] = this.attendance;
    data['performance_rate'] = this.performanceRate;
    return data;
  }
}
