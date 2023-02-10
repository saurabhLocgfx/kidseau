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
  String? workingDay;
  String? kidAttendDay;
  String? holiDay;

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
      this.workingDay,
      this.kidAttendDay,
      this.holiDay,
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
    workingDay = json['workingDay'];
    kidAttendDay = json['kidAttendDay'];
    holiDay = json['holiDay'];
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
    data['workingDay'] = this.workingDay;
    data['kidAttendDay'] = this.kidAttendDay;
    data['holiDay'] = this.holiDay;
    return data;
  }
}

class Attendance {
  String? day1;
  String? day2;
  String? day3;
  String? day4;
  String? day5;

  Attendance({this.day1, this.day2, this.day3});

  Attendance.fromJson(Map<String, dynamic> json) {
    day1 = json['day-1'];
    day2 = json['day-2'];
    day3 = json['day-3'];
    day4 = json['day-4'];
    day5 = json['day-5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day-1'] = this.day1;
    data['day-2'] = this.day2;
    data['day-3'] = this.day3;
    data['day-4'] = this.day4;
    data['day-5'] = this.day5;
    return data;
  }
}

class Actvity {
  String? actName;
  String? pfmSum;
  String? totalSub;

  Actvity({this.actName, this.pfmSum});

  Actvity.fromJson(Map<String, dynamic> json) {
    actName = json['act_name'];
    pfmSum = json['pfm_sum'];
    totalSub = json['total_sub'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['act_name'] = this.actName;
    data['pfm_sum'] = this.pfmSum;
    data['total_sub'] = this.totalSub;
    return data;
  }
}
