class TeacherSyllabusModel {
  int? status;
  List<Syllabus>? syllabus;

  TeacherSyllabusModel({this.status, this.syllabus});

  TeacherSyllabusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['syllabus'] != null) {
      syllabus = <Syllabus>[];
      json['syllabus'].forEach((v) {
        syllabus!.add(new Syllabus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.syllabus != null) {
      data['syllabus'] = this.syllabus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Syllabus {
  String? actId;
  String? actTitle;
  String? actIcon;
  String? timing;

  Syllabus({this.actId, this.actTitle, this.actIcon, this.timing});

  Syllabus.fromJson(Map<String, dynamic> json) {
    actId = json['act_id'];
    actTitle = json['act_title'];
    actIcon = json['act_icon'];
    timing = json['timing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['act_id'] = this.actId;
    data['act_title'] = this.actTitle;
    data['act_icon'] = this.actIcon;
    data['timing'] = this.timing;
    return data;
  }
}
