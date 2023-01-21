class KidPerformanceDetailModel {
  int? status;
  String? kidName;
  String? kidImage;
  String? kidDob;
  int? kidAge;
  String? kidGender;
  String? kidFather;
  String? kidGroup;
  String? kidSection;
  String? rank;
  Attendance? attendance;
  List<Actvity>? actvity;
  String? allDayAttendance;

  KidPerformanceDetailModel(
      {this.status,
      this.kidName,
      this.kidImage,
      this.kidDob,
      this.kidAge,
      this.kidGender,
      this.kidFather,
      this.kidGroup,
      this.kidSection,
      this.rank,
      this.attendance,
      this.actvity,
      this.allDayAttendance});

  KidPerformanceDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    kidName = json['kidName'];
    kidImage = json['kidImage'];
    kidDob = json['kidDob'];
    kidAge = json['kidAge'];
    kidGender = json['kidGender'];
    kidFather = json['kidFather'];
    kidGroup = json['kidGroup'];
    kidSection = json['kidSection'];
    rank = json['rank'];
    attendance = json['attendance'] != null
        ? new Attendance.fromJson(json['attendance'])
        : null;
    if (json['actvity'] != null) {
      actvity = <Actvity>[];
      json['actvity'].forEach((v) {
        actvity!.add(new Actvity.fromJson(v));
      });
    }
    allDayAttendance = json['allDayAttendance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['kidName'] = this.kidName;
    data['kidImage'] = this.kidImage;
    data['kidDob'] = this.kidDob;
    data['kidAge'] = this.kidAge;
    data['kidGender'] = this.kidGender;
    data['kidFather'] = this.kidFather;
    data['kidGroup'] = this.kidGroup;
    data['kidSection'] = this.kidSection;
    data['rank'] = this.rank;
    if (this.attendance != null) {
      data['attendance'] = this.attendance!.toJson();
    }
    if (this.actvity != null) {
      data['actvity'] = this.actvity!.map((v) => v.toJson()).toList();
    }
    data['allDayAttendance'] = this.allDayAttendance;
    return data;
  }
}

class Attendance {
  String? day1;
  String? day2;
  String? day3;

  Attendance({this.day1, this.day2, this.day3});

  Attendance.fromJson(Map<String, dynamic> json) {
    day1 = json['day-1'];
    day2 = json['day-2'];
    day3 = json['day-3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day-1'] = this.day1;
    data['day-2'] = this.day2;
    data['day-3'] = this.day3;
    return data;
  }
}

class Actvity {
  String? actName;
  String? pfmSum;

  Actvity({this.actName, this.pfmSum});

  Actvity.fromJson(Map<String, dynamic> json) {
    actName = json['act_name'];
    pfmSum = json['pfm_sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['act_name'] = this.actName;
    data['pfm_sum'] = this.pfmSum;
    return data;
  }
}
