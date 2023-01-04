class SchoolMyPostModel {
  int? status;
  List<PostDetails>? postDetails;

  SchoolMyPostModel({this.status, this.postDetails});

  SchoolMyPostModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['postDetails'] != null) {
      postDetails = <PostDetails>[];
      json['postDetails'].forEach((v) {
        postDetails!.add(new PostDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.postDetails != null) {
      data['postDetails'] = this.postDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostDetails {
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
  List<Images>? images;

  PostDetails(
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
        this.images});

  PostDetails.fromJson(Map<String, dynamic> json) {
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
    if (json['Images'] != null) {
      images = <Images>[];
      json['Images'].forEach((v) {
        images!.add(new Images.fromJson(v));
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
    if (this.images != null) {
      data['Images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? fileId;
  String? fileImage;

  Images({this.fileId, this.fileImage});

  Images.fromJson(Map<String, dynamic> json) {
    fileId = json['fileId'];
    fileImage = json['fileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileId'] = this.fileId;
    data['fileImage'] = this.fileImage;
    return data;
  }
}