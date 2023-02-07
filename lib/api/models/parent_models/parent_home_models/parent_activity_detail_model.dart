class ParentActivityDetailModel {
  int? status;
  Activity? activity;

  ParentActivityDetailModel({this.status, this.activity});

  ParentActivityDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    activity = json['activity'] != null
        ? new Activity.fromJson(json['activity'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.activity != null) {
      data['activity'] = this.activity!.toJson();
    }
    return data;
  }
}

class Activity {
  String? actTitle;
  String? actImage;
  String? actDecription;
  String? actTime;
  String? teacherName;
  String? teachImage;
  String? teachId;
  int? classTeacher;
  String? lang;

  Activity(
      {this.actTitle,
      this.actImage,
      this.actDecription,
      this.actTime,
      this.teachId,
      this.teacherName,
      this.teachImage,
      this.classTeacher,
      this.lang});

  Activity.fromJson(Map<String, dynamic> json) {
    actTitle = json['actTitle'];
    actImage = json['actImage'];
    actDecription = json['actDecription'];
    actTime = json['actTime'];
    teachId = json['teacher_id'];
    teacherName = json['teacherName'];
    teachImage = json['teachImage'];
    classTeacher = json['classTeacher'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actTitle'] = this.actTitle;
    data['actImage'] = this.actImage;
    data['actDecription'] = this.actDecription;
    data['actTime'] = this.actTime;
    data['teacherName'] = this.teacherName;
    data['teacher_id'] = this.teachId;
    data['teachImage'] = this.teachImage;
    data['classTeacher'] = this.classTeacher;
    data['lang'] = this.lang;
    return data;
  }
}
