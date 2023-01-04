class SchoolPostModel {
  int? status;
  List<SchoolAllPost>? schoolAllPost;

  SchoolPostModel({this.status, this.schoolAllPost});

  SchoolPostModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    if (json['schoolAllPost'] != null) {
      schoolAllPost = <SchoolAllPost>[];
      json['schoolAllPost'].forEach((v) {
        schoolAllPost!.add(new SchoolAllPost.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    if (this.schoolAllPost != null) {
      data['schoolAllPost'] =
          this.schoolAllPost!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SchoolAllPost {
  String? teacherId;
  String? fName;
  String? familyName;
  String? techProfile;
  String? postId;
  String? captions;
  String? postTime;
  String? postDate;
  int? like;
  int? likeStatus;
  List<Image>? image;

  SchoolAllPost(
      {this.teacherId,
        this.fName,
        this.familyName,
        this.techProfile,
        this.postId,
        this.captions,
        this.postTime,
        this.postDate,
        this.like,
        this.likeStatus,
        this.image});

  SchoolAllPost.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    fName = json['f_name'];
    likeStatus = json['likeStatus'];
    familyName = json['family_name'];
    techProfile = json['tech_profile'];
    postId = json['post_id'];
    captions = json['captions'];
    postTime = json['post_time'];
    postDate = json['post_date'];
    like = json['like'];
    if (json['Image'] != null) {
      image = <Image>[];
      json['Image'].forEach((v) {
        image!.add(new Image.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teacher_id'] = this.teacherId;
    data['f_name'] = this.fName;
    data['family_name'] = this.familyName;
    data['tech_profile'] = this.techProfile;
    data['post_id'] = this.postId;
    data['captions'] = this.captions;
    data['post_time'] = this.postTime;
    data['post_date'] = this.postDate;
    data['like'] = this.like;
    if (this.image != null) {
      data['Image'] = this.image!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Image {
  String? fileId;
  String? fileName;

  Image({this.fileId, this.fileName});

  Image.fromJson(Map<String, dynamic> json) {
    fileId = json['fileId'];
    fileName = json['fileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileId'] = this.fileId;
    data['fileName'] = this.fileName;
    return data;
  }
}