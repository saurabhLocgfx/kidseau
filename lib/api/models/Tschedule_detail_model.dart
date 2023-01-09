class TScheduleDetailModel {
  int? status;
  LearningAlaphabets? learningAlaphabets;
  List<String>? weakStudent;

  TScheduleDetailModel({this.status, this.learningAlaphabets, this.weakStudent});

  TScheduleDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    learningAlaphabets = json['learningAlaphabets'] != null
        ? new LearningAlaphabets.fromJson(json['learningAlaphabets'])
        : null;
    weakStudent = json['weakStudent'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.learningAlaphabets != null) {
      data['learningAlaphabets'] = this.learningAlaphabets!.toJson();
    }
    data['weakStudent'] = this.weakStudent;
    return data;
  }
}

class LearningAlaphabets {
  String? title;
  String? image;
  String? description;
  String? time;

  LearningAlaphabets({this.title, this.image, this.description, this.time});

  LearningAlaphabets.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    description = json['description'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['time'] = this.time;
    return data;
  }
}