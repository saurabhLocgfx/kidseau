class TeacherProfileDetailsModel {
  int? status;
  String? image;
  String? name;
  String? education;
  String? email;
  School? school;
  String? info;
  String? fristName;
  String? familyName;
  String? gender;
  String? brithday;
  String? yearOfExp;
  String? address;
  String? phoneNumber;

  TeacherProfileDetailsModel(
      {this.status,
        this.image,
        this.name,
        this.education,
        this.email,
        this.school,
        this.info,
        this.fristName,
        this.familyName,
        this.gender,
        this.brithday,
        this.yearOfExp,
        this.phoneNumber,
        this.address});

  TeacherProfileDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    phoneNumber = json['phoneNumber'];
    image = json['image'];
    name = json['name'];
    education = json['education'];
    email = json['email'];
    school =
    json['school'] != null ? new School.fromJson(json['school']) : null;
    info = json['info'];
    fristName = json['fristName'];
    familyName = json['familyName'];
    gender = json['gender'];
    brithday = json['brithday'];
    yearOfExp = json['yearOfExp.'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['image'] = this.image;
    data['name'] = this.name;
    data['education'] = this.education;
    data['email'] = this.email;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    data['info'] = this.info;
    data['fristName'] = this.fristName;
    data['familyName'] = this.familyName;
    data['gender'] = this.gender;
    data['brithday'] = this.brithday;
    data['yearOfExp.'] = this.yearOfExp;
    data['address'] = this.address;
    return data;
  }
}

class School {
  String? schoolId;
  String? schoolImage;
  String? schoolName;
  String? schoolTime;
  String? schoolPhone;

  School(
      {this.schoolId,
        this.schoolImage,
        this.schoolName,
        this.schoolTime,
        this.schoolPhone});

  School.fromJson(Map<String, dynamic> json) {
    schoolId = json['schoolId'];
    schoolImage = json['schoolImage'];
    schoolName = json['schoolName'];
    schoolTime = json['schoolTime'];
    schoolPhone = json['schoolPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schoolId'] = this.schoolId;
    data['schoolImage'] = this.schoolImage;
    data['schoolName'] = this.schoolName;
    data['schoolTime'] = this.schoolTime;
    data['schoolPhone'] = this.schoolPhone;
    return data;
  }
}