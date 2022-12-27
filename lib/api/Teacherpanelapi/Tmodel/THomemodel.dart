class THomeModel {
  int? status;
  String? hello;
  List<Group>? group;
  List<Attendance>? attendance;

  List<Schdule>? schdule;
  // String? attendance;
  //
  THomeModel(
      {this.status, this.hello, this.group, this.schdule, this.attendance});

  THomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    hello = json['Hello'];
    if (json['Group'] != null) {
      group = <Group>[];
      json['Group'].forEach((v) {
        group!.add(new Group.fromJson(v));
      });
    }
    if (json['Schdule'] != null) {
      schdule = <Schdule>[];
      json['Schdule'].forEach((v) {
        schdule!.add(new Schdule.fromJson(v));
      });
    }
    if (json['Attendance'] != null) {
      attendance = <Attendance>[];
      json['Attendance'].forEach((v) {
        attendance!.add(new Attendance.fromJson(v));
      });
    }
    // attendance = json['attendance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Hello'] = this.hello;
    if (this.group != null) {
      data['Group'] = this.group!.map((v) => v.toJson()).toList();
    }
    if (this.schdule != null) {
      data['Schdule'] = this.schdule!.map((v) => v.toJson()).toList();
    }
    if (this.attendance != null) {
      data['Attendance'] = this.attendance!.map((v) => v.toJson()).toList();
    }
    // data['attendance'] = this.attendance;
    return data;
  }
}

class Group {
  String? id;
  String? name;
  String? section;
  String? image;
  int? students;

  Group({this.id, this.name, this.section, this.image, this.students});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    section = json['Section'];
    image = json['image'];
    students = json['students'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['Section'] = this.section;
    data['image'] = this.image;
    data['students'] = this.students;
    return data;
  }
}

class Attendance {
  String? id;
  String? name;
  String? section;
  String? image;
  int? students;
  int? status;

  Attendance(
      {this.id,
      this.name,
      this.section,
      this.image,
      this.students,
      this.status});

  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    section = json['Section'];
    image = json['image'];
    students = json['students'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['Section'] = this.section;
    data['image'] = this.image;
    data['students'] = this.students;
    data['status'] = this.status;
    return data;
  }
}

class Schdule {
  String? actId;
  String? icon;
  String? title;
  String? time;

  Schdule({this.actId, this.icon, this.title, this.time});

  Schdule.fromJson(Map<String, dynamic> json) {
    actId = json[' act_id'];
    icon = json['Icon'];
    title = json['Title'];
    time = json['Time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[' act_id'] = this.actId;
    data['Icon'] = this.icon;
    data['Title'] = this.title;
    data['Time'] = this.time;
    return data;
  }
}
