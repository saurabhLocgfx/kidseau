class ParentActivityHomeModel {
  int? status;
  String? greet;
  List<KidAndActivity>? kidAndActivity;
  List<VideoTutorial>? videoTutorial;

  ParentActivityHomeModel(
      {this.status, this.greet, this.kidAndActivity, this.videoTutorial});

  ParentActivityHomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    greet = json['greet'];
    if (json['kidAndActivity'] != null) {
      kidAndActivity = <KidAndActivity>[];
      json['kidAndActivity'].forEach((v) {
        kidAndActivity!.add(new KidAndActivity.fromJson(v));
      });
    }
    if (json['videoTutorial'] != null) {
      videoTutorial = <VideoTutorial>[];
      json['videoTutorial'].forEach((v) {
        videoTutorial!.add(new VideoTutorial.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['greet'] = this.greet;
    if (this.kidAndActivity != null) {
      data['kidAndActivity'] =
          this.kidAndActivity!.map((v) => v.toJson()).toList();
    }
    if (this.videoTutorial != null) {
      data['videoTutorial'] =
          this.videoTutorial!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KidAndActivity {
  String? actId;
  String? actTitle;
  String? actIcon;
  String? timing;

  KidAndActivity({this.actId, this.actTitle, this.actIcon, this.timing});

  KidAndActivity.fromJson(Map<String, dynamic> json) {
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

class VideoTutorial {
  String? vTitle;
  String? video;
  String? vPoster;
  String? vDate;

  VideoTutorial({this.vTitle, this.video, this.vPoster, this.vDate});

  VideoTutorial.fromJson(Map<String, dynamic> json) {
    vTitle = json['v_title'];
    video = json['video'];
    vPoster = json['v_poster'];
    vDate = json['v_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['v_title'] = this.vTitle;
    data['video'] = this.video;
    data['v_poster'] = this.vPoster;
    data['v_date'] = this.vDate;
    return data;
  }
}
