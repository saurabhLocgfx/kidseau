class ParentKidOverviewModel {
  int? status;
  KidDetails? kidDetails;

  ParentKidOverviewModel({this.status, this.kidDetails});

  ParentKidOverviewModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    kidDetails = json['kid_Details'] != null
        ? new KidDetails.fromJson(json['kid_Details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    if (this.kidDetails != null) {
      data['kid_Details'] = this.kidDetails!.toJson();
    }
    return data;
  }
}

class KidDetails {
  String? kidId;
  String? kidImage;
  String? kidName;
  String? kidFather;
  String? kidVoucher;
  String? kidClass;
  String? kidDob;
  String? sectionName;
  int? kidAge;
  String? kidGender;
  String? rank;
  Attendance? attendance;
  List<Actvity>? actvity;
  String? workingDay;
  String? kidAttendDay;
  String? holiDay;
  TeacherDetails? teacherDetails;

  KidDetails(
      {this.kidId,
      this.kidImage,
      this.kidName,
      this.kidFather,
      this.kidVoucher,
      this.sectionName,
      this.kidClass,
      this.kidDob,
      this.kidAge,
      this.kidGender,
      this.rank,
      this.attendance,
      this.actvity,
      this.workingDay,
      this.kidAttendDay,
      this.holiDay,
      this.teacherDetails});

  KidDetails.fromJson(Map<String, dynamic> json) {
    kidId = json['Kid_id'];
    kidImage = json['kid_image'];
    sectionName = json['section_name'];
    kidName = json['kid_name'];
    kidFather = json['kid_father'];
    kidVoucher = json['kid_voucher'];
    kidClass = json['kid_class'];
    kidDob = json['kid_dob'];
    kidAge = json['kid_age'];
    kidGender = json['kid_gender'];
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
    workingDay = json['workingDay'];
    kidAttendDay = json['kidAttendDay'];
    holiDay = json['holiDay'];
    teacherDetails = json['teacherDetails'] != null
        ? new TeacherDetails.fromJson(json['teacherDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Kid_id'] = this.kidId;
    data['section_name'] = this.sectionName;
    data['kid_image'] = this.kidImage;
    data['kid_name'] = this.kidName;
    data['kid_father'] = this.kidFather;
    data['kid_voucher'] = this.kidVoucher;
    data['kid_class'] = this.kidClass;
    data['kid_dob'] = this.kidDob;
    data['kid_age'] = this.kidAge;
    data['kid_gender'] = this.kidGender;
    data['rank'] = this.rank;
    if (this.attendance != null) {
      data['attendance'] = this.attendance!.toJson();
    }
    if (this.actvity != null) {
      data['actvity'] = this.actvity!.map((v) => v.toJson()).toList();
    }
    data['workingDay'] = this.workingDay;
    data['kidAttendDay'] = this.kidAttendDay;
    data['holiDay'] = this.holiDay;
    if (this.teacherDetails != null) {
      data['teacherDetails'] = this.teacherDetails!.toJson();
    }
    return data;
  }
}

class Attendance {
  String? day1;
  String? day2;
  String? day3;
  String? day4;
  String? day5;

  Attendance({this.day1, this.day2, this.day3, this.day4, this.day5});

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

  Actvity({this.actName, this.pfmSum, this.totalSub});

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

class TeacherDetails {
  String? teacherId;
  String? teacherName;
  String? teacherImage;
  String? type;
  String? lang;

  TeacherDetails(
      {this.teacherId, this.teacherName, this.teacherImage, this.type});

  TeacherDetails.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    teacherName = json['teacher_name'];
    teacherImage = json['teacher_image'];
    type = json['type'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teacher_id'] = this.teacherId;
    data['teacher_name'] = this.teacherName;
    data['teacher_image'] = this.teacherImage;
    data['type'] = this.type;
    data['lang'] = this.lang;
    return data;
  }
}
