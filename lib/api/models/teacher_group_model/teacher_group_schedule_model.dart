class TeacherGroupsScheduelModel {
  int? status;
  List<Schdule>? schdule;

  TeacherGroupsScheduelModel({this.status, this.schdule});

  TeacherGroupsScheduelModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['schdule'] != null) {
      schdule = <Schdule>[];
      json['schdule'].forEach((v) {
        schdule!.add(new Schdule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.schdule != null) {
      data['schdule'] = this.schdule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schdule {
  String? actId;
  String? actTitle;
  String? actIcon;
  String? timing;

  Schdule({this.actId, this.actTitle, this.actIcon, this.timing});

  Schdule.fromJson(Map<String, dynamic> json) {
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