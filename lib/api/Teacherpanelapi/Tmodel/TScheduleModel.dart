class TScheduleModel {
  String? ststus;
  List<Schedule>? schedule;

  TScheduleModel({this.ststus, this.schedule});

  TScheduleModel.fromJson(Map<String, dynamic> json) {
    ststus = json['Ststus'];
    if (json['Schedule'] != null) {
      schedule = <Schedule>[];
      json['Schedule'].forEach((v) {
        schedule!.add(new Schedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Ststus'] = this.ststus;
    if (this.schedule != null) {
      data['Schedule'] = this.schedule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schedule {
  String? actId;
  String? actIcon;
  String? actTitle;
  String? actTimeStart;
  String? actTimeEnd;

  Schedule(
      {this.actId,
      this.actIcon,
      this.actTitle,
      this.actTimeStart,
      this.actTimeEnd});

  Schedule.fromJson(Map<String, dynamic> json) {
    actId = json['act_id'];
    actIcon = json['act_icon'];
    actTitle = json['act_title'];
    actTimeStart = json['act_time_start'];
    actTimeEnd = json['act_time_end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['act_id'] = this.actId;
    data['act_icon'] = this.actIcon;
    data['act_title'] = this.actTitle;
    data['act_time_start'] = this.actTimeStart;
    data['act_time_end'] = this.actTimeEnd;
    return data;
  }
}
