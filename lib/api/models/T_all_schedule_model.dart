class TAllScheduleModel {
  int? status;
  List<Schdule>? schdule;

  TAllScheduleModel({this.status, this.schdule});

  TAllScheduleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Schdule'] != null) {
      schdule = <Schdule>[];
      json['Schdule'].forEach((v) {
        schdule!.add(new Schdule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.schdule != null) {
      data['Schdule'] = this.schdule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schdule {
  String? actId;
  String? actTitle;
  String? actIcon;
  String? timing;
  String? grpName;

  Schdule({this.actId, this.actTitle, this.actIcon, this.timing, this.grpName});

  Schdule.fromJson(Map<String, dynamic> json) {
    actId = json['act_id'];
    actTitle = json['act_title'];
    actIcon = json['act_icon'];
    timing = json['timing'];
    grpName = json['grp_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['act_id'] = this.actId;
    data['act_title'] = this.actTitle;
    data['act_icon'] = this.actIcon;
    data['timing'] = this.timing;
    data['grp_name'] = this.grpName;
    return data;
  }
}