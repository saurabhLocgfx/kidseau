class KidDetailModel {
  int? status;
  String? kidId;
  String? image;
  String? name;
  String? youare;
  String? group;
  int? age;
  String? birthday;
  String? gender;
  String? address;
  String? motherName;
  String? mOccupation;
  String? motherEmail;
  String? motherPhone;
  String? fatherName;
  String? fOccupation;
  String? fatherEmail;
  String? fatherPhone;
  String? bloodGroup;
  String? weight;
  String? height;
  String? medicalstatus;
  String? anyExtraToTackCare;
  List<String>? covidVaccination;
  List<String>? otherVaccination;

  KidDetailModel(
      {this.status,
      this.kidId,
      this.image,
      this.name,
      this.youare,
      this.group,
      this.age,
      this.birthday,
      this.gender,
      this.address,
      this.motherName,
      this.mOccupation,
      this.motherEmail,
      this.motherPhone,
      this.fatherName,
      this.fOccupation,
      this.fatherEmail,
      this.fatherPhone,
      this.bloodGroup,
      this.weight,
      this.height,
      this.medicalstatus,
      this.anyExtraToTackCare,
      this.covidVaccination,
      this.otherVaccination});

  KidDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    kidId = json['kid_id'];
    image = json['image'];
    name = json['name '];
    youare = json['youare'];
    group = json['group'];
    age = json['age'];
    birthday = json['birthday'];
    gender = json['gender'];
    address = json['address'];
    motherName = json['motherName'];
    mOccupation = json['mOccupation'];
    motherEmail = json['motherEmail'];
    motherPhone = json['motherPhone'];
    fatherName = json['fatherName'];
    fOccupation = json['fOccupation'];
    fatherEmail = json['fatherEmail'];
    fatherPhone = json['fatherPhone'];
    bloodGroup = json['bloodGroup'];
    weight = json['weight'];
    height = json['height'];
    medicalstatus = json['medicalstatus'];
    anyExtraToTackCare = json['anyExtraToTackCare'];
    covidVaccination = json['covidVaccination'].cast<String>();
    otherVaccination = json['otherVaccination'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['kid_id'] = this.kidId;
    data['image'] = this.image;
    data['name '] = this.name;
    data['youare'] = this.youare;
    data['group'] = this.group;
    data['age'] = this.age;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['motherName'] = this.motherName;
    data['mOccupation'] = this.mOccupation;
    data['motherEmail'] = this.motherEmail;
    data['motherPhone'] = this.motherPhone;
    data['fatherName'] = this.fatherName;
    data['fOccupation'] = this.fOccupation;
    data['fatherEmail'] = this.fatherEmail;
    data['fatherPhone'] = this.fatherPhone;
    data['bloodGroup'] = this.bloodGroup;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['medicalstatus'] = this.medicalstatus;
    data['anyExtraToTackCare'] = this.anyExtraToTackCare;
    data['covidVaccination'] = this.covidVaccination;
    data['otherVaccination'] = this.otherVaccination;
    return data;
  }
}
