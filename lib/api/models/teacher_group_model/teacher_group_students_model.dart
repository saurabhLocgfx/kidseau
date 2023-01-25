class TGroupStudentsModel {
  int? status;
  List<Student>? student;

  TGroupStudentsModel({this.status, this.student});

  TGroupStudentsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['student'] != null) {
      student = <Student>[];
      json['student'].forEach((v) {
        student!.add(new Student.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.student != null) {
      data['student'] = this.student!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Student {
  String? kidId;
  String? name;
  String? image;
  String? sectionName;
  String? fatherName;
  String? rank;

  Student(
      {this.kidId,
      this.name,
      this.image,
      this.sectionName,
      this.fatherName,
      this.rank});

  Student.fromJson(Map<String, dynamic> json) {
    kidId = json['kidId'];
    name = json['name'];
    image = json['image'];
    sectionName = json['sectionName'];
    fatherName = json['fatherName'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kidId'] = this.kidId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['sectionName'] = this.sectionName;
    data['fatherName'] = this.fatherName;
    data['rank'] = this.rank;
    return data;
  }
}
