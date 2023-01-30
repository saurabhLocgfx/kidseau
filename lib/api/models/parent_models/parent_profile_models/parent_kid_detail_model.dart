class PKidsDetailModel {
  int? status;
  String? kidId;
  String? image;
  String? name;
  String? youAre;
  String? kidGroup;
  int? age;
  String? birthday;
  String? gender;
  String? address;
  String? motherSName;
  String? occupation;
  String? motherEmail;
  String? motherPhone;
  String? fatherName;
  String? fatherEmail;
  String? fatherPhone;
  String? bloodGroup;
  String? weight;
  String? height;
  String? medicalStatus;
  String? anyExtraToTackCare;
  List<String>? covidVaccination;
  List<String>? otherVaccination;

  PKidsDetailModel(
      {this.status,
      this.kidId,
      this.image,
      this.name,
      this.youAre,
      this.kidGroup,
      this.age,
      this.birthday,
      this.gender,
      this.address,
      this.motherSName,
      this.occupation,
      this.motherEmail,
      this.motherPhone,
      this.fatherName,
      this.fatherEmail,
      this.fatherPhone,
      this.bloodGroup,
      this.weight,
      this.height,
      this.medicalStatus,
      this.anyExtraToTackCare,
      this.covidVaccination,
      this.otherVaccination});

  PKidsDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    kidId = json['kid_id'];
    image = json['image'];
    name = json['name'];
    youAre = json['youAre'];
    kidGroup = json['kid_group'];
    age = json['age'];
    birthday = json['birthday'];
    gender = json['gender'];
    address = json['address'];
    motherSName = json["mother'sName"];
    occupation = json['occupation'];
    motherEmail = json['motherEmail'];
    motherPhone = json['motherPhone'];
    fatherName = json['fatherName'];
    fatherEmail = json['fatherEmail'];
    fatherPhone = json['fatherPhone'];
    bloodGroup = json['bloodGroup'];
    weight = json['weight'];
    height = json['height'];
    medicalStatus = json['medicalStatus'];
    anyExtraToTackCare = json['anyExtraToTackCare'];
    covidVaccination = json['covidVaccination'].cast<String>();
    otherVaccination = json['otherVaccination'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['kid_id'] = this.kidId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['youAre'] = this.youAre;
    data['kid_group'] = this.kidGroup;
    data['age'] = this.age;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data["mother'sName"] = this.motherSName;
    data['occupation'] = this.occupation;
    data['motherEmail'] = this.motherEmail;
    data['motherPhone'] = this.motherPhone;
    data['fatherName'] = this.fatherName;
    data['fatherEmail'] = this.fatherEmail;
    data['fatherPhone'] = this.fatherPhone;
    data['bloodGroup'] = this.bloodGroup;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['medicalStatus'] = this.medicalStatus;
    data['anyExtraToTackCare'] = this.anyExtraToTackCare;
    data['covidVaccination'] = this.covidVaccination;
    data['otherVaccination'] = this.otherVaccination;
    return data;
  }
}
