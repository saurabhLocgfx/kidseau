class PSyllabusModel {
  int? status;
  List<AllSchdule>? allSchdule;

  PSyllabusModel({this.status, this.allSchdule});

  PSyllabusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['allSchdule'] != null) {
      allSchdule = <AllSchdule>[];
      json['allSchdule'].forEach((v) {
        allSchdule!.add(new AllSchdule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.allSchdule != null) {
      data['allSchdule'] = this.allSchdule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllSchdule {
  String? actId;
  String? actTitle;
  String? actIcon;
  String? timing;
  String? dayId;

  AllSchdule(
      {this.actId, this.actTitle, this.actIcon, this.timing, this.dayId});

  AllSchdule.fromJson(Map<String, dynamic> json) {
    actId = json['act_id'];
    dayId = json['day_id'];
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
