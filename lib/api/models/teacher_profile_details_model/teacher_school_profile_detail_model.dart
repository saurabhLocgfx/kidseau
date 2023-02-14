class TeacherSchoolProfileDetailsModel {
  String? status;
  String? schoolImage;
  String? schoolName;
  String? schoolTime;
  String? schoolEmail;
  String? schoolPhone;
  String? schoolAddress;
  SocialMedia? socialMedia;
  String? directorImage;
  String? directorName;
  String? directorEmail;
  String? directorPhone;

  TeacherSchoolProfileDetailsModel(
      {this.status,
      this.schoolImage,
      this.schoolName,
      this.schoolTime,
      this.schoolEmail,
      this.schoolPhone,
      this.schoolAddress,
      this.socialMedia,
      this.directorImage,
      this.directorName,
      this.directorEmail,
      this.directorPhone});

  TeacherSchoolProfileDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    schoolImage = json['schoolImage'];
    schoolName = json['schoolName'];
    schoolTime = json['schoolTime'];
    schoolEmail = json['schoolEmail'];
    schoolPhone = json['schoolPhone'];
    schoolAddress = json['schoolAddress'];
    socialMedia = json['socialMedia'] != null
        ? new SocialMedia.fromJson(json['socialMedia'])
        : null;
    directorImage = json['directorImage'];
    directorName = json['directorName'];
    directorEmail = json['directorEmail'];
    directorPhone = json['directorPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['schoolImage'] = this.schoolImage;
    data['schoolName'] = this.schoolName;
    data['schoolTime'] = this.schoolTime;
    data['schoolEmail'] = this.schoolEmail;
    data['schoolPhone'] = this.schoolPhone;
    data['schoolAddress'] = this.schoolAddress;
    if (this.socialMedia != null) {
      data['socialMedia'] = this.socialMedia!.toJson();
    }
    data['directorImage'] = this.directorImage;
    data['directorName'] = this.directorName;
    data['directorEmail'] = this.directorEmail;
    data['directorPhone'] = this.directorPhone;
    return data;
  }
}

class SocialMedia {
  String? facebook;
  String? twitter;
  String? linkedIn;
  String? instagram;
  String? mapLocation;

  SocialMedia(
      {this.facebook,
      this.twitter,
      this.linkedIn,
      this.instagram,
      this.mapLocation});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    twitter = json['twitter'];
    linkedIn = json['linkedIn'];
    instagram = json['instagram'];
    mapLocation = json['mapLocation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['linkedIn'] = this.linkedIn;
    data['instagram'] = this.instagram;
    data['mapLocation'] = this.mapLocation;
    return data;
  }
}
