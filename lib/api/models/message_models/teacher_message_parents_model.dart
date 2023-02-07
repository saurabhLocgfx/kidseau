class TeacherMessageParentsModel {
  String? kidId;
  String? name;
  String? profilePic;
  String? parentId;
  String? fatherName;
  String? profilePhoto;

  TeacherMessageParentsModel(
      {this.kidId,
      this.name,
      this.profilePic,
      this.parentId,
      this.fatherName,
      this.profilePhoto});

  TeacherMessageParentsModel.fromJson(Map<String, dynamic> json) {
    kidId = json['kid_id'];
    name = json['name'];
    profilePic = json['profile_pic'];
    parentId = json['parent_id'];
    fatherName = json['father_name'];
    profilePhoto = json['profile_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kid_id'] = this.kidId;
    data['name'] = this.name;
    data['profile_pic'] = this.profilePic;
    data['parent_id'] = this.parentId;
    data['father_name'] = this.fatherName;
    data['profile_photo'] = this.profilePhoto;
    return data;
  }
}
