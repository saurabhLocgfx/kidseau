class TScheduleDetailModel {
  int? status;
  LearningAlaphabets? learningAlaphabets;
  List<WeakStudent>? weakStudent;

  TScheduleDetailModel(
      {this.status, this.learningAlaphabets, this.weakStudent});

  TScheduleDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    learningAlaphabets = json['learningAlaphabets'] != null
        ? new LearningAlaphabets.fromJson(json['learningAlaphabets'])
        : null;
    if (json['weakStudent'] != null) {
      weakStudent = <WeakStudent>[];
      json['weakStudent'].forEach((v) {
        weakStudent!.add(new WeakStudent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.learningAlaphabets != null) {
      data['learningAlaphabets'] = this.learningAlaphabets!.toJson();
    }
    if (this.weakStudent != null) {
      data['weakStudent'] = this.weakStudent!.map((v) => v.toJson()).toList();
    }
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

class WeakStudent {
  String? kidId;
  String? name;
  String? image;
  String? sectionName;
  String? actTime;
  String? rank;

  WeakStudent(
      {this.kidId,
      this.name,
      this.image,
      this.sectionName,
      this.actTime,
      this.rank});

  WeakStudent.fromJson(Map<String, dynamic> json) {
    kidId = json['kidId'];
    name = json['name'];
    image = json['image'];
    sectionName = json['sectionName'];
    actTime = json['actTime'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kidId'] = this.kidId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['sectionName'] = this.sectionName;
    data['actTime'] = this.actTime;
    data['rank'] = this.rank;
    return data;
  }
}
