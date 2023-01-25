class TStudentsModel {
  String? kidId;
  String? name;
  String? image;
  String? sectionName;
  String? fatherName;
  String? rank;

  TStudentsModel(
      {this.kidId,
      this.name,
      this.image,
      this.sectionName,
      this.fatherName,
      this.rank});

  TStudentsModel.fromJson(Map<String, dynamic> json) {
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
