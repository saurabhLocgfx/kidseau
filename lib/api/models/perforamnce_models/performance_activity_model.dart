class PerformanceActivityModel {
  int? status;
  List<AllKidActvity>? allKidActvity;

  PerformanceActivityModel({this.status, this.allKidActvity});

  PerformanceActivityModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['allKidActvity'] != null) {
      allKidActvity = <AllKidActvity>[];
      json['allKidActvity'].forEach((v) {
        allKidActvity!.add(new AllKidActvity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.allKidActvity != null) {
      data['allKidActvity'] =
          this.allKidActvity!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllKidActvity {
  String? grpId;
  String? actTitle;
  String? dayActId;

  AllKidActvity({this.grpId, this.actTitle, this.dayActId});

  AllKidActvity.fromJson(Map<String, dynamic> json) {
    grpId = json['grp_id'];
    actTitle = json['act_title'];
    dayActId = json['day_act_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grp_id'] = this.grpId;
    data['act_title'] = this.actTitle;
    data['day_act_id'] = this.dayActId;
    return data;
  }
}
