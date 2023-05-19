class VoucherVideoModel {
  int? status;
  List<AppVideo>? appVideo;

  VoucherVideoModel({this.status, this.appVideo});

  VoucherVideoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['appVideo'] != null) {
      appVideo = <AppVideo>[];
      json['appVideo'].forEach((v) {
        appVideo!.add(new AppVideo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.appVideo != null) {
      data['appVideo'] = this.appVideo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppVideo {
  String? vTitle;
  String? video;
  String? vPoster;
  String? vDate;

  AppVideo({this.vTitle, this.video, this.vPoster, this.vDate});

  AppVideo.fromJson(Map<String, dynamic> json) {
    vTitle = json['v_title'];
    video = json['v_video'];
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
