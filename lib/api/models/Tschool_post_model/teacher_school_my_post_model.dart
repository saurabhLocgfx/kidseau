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
  String? secId;
  String? secName;
  String? grpId;
  String? grpName;
  int? like;
  int? likeStatus;
  List<Images>? images;
  List<TagKid>? tagKid;

  PostDetails(
      {this.teacherId,
      this.fName,
      this.familyName,
      this.techProfile,
      this.postId,
      this.captions,
      this.postTime,
      this.postDate,
      this.secId,
      this.secName,
      this.grpId,
      this.grpName,
      this.like,
      this.likeStatus,
      this.images,
      this.tagKid});

  PostDetails.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    fName = json['f_name'];
    familyName = json['family_name'];
    techProfile = json['tech_profile'];
    postId = json['post_id'];
    captions = json['captions'];
    postTime = json['post_time'];
    postDate = json['post_date'];
    secId = json['sec_id'];
    secName = json['sec_name'];
    grpId = json['grp_id'];
    grpName = json['grp_name'];
    like = json['like'];
    likeStatus = json['likeStatus'];
    if (json['Images'] != null) {
      images = <Images>[];
      json['Images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['tagKid'] != null) {
      tagKid = <TagKid>[];
      json['tagKid'].forEach((v) {
        tagKid!.add(new TagKid.fromJson(v));
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
    data['sec_id'] = this.secId;
    data['sec_name'] = this.secName;
    data['grp_id'] = this.grpId;
    data['grp_name'] = this.grpName;
    data['like'] = this.like;
    data['likeStatus'] = this.likeStatus;
    if (this.images != null) {
      data['Images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.tagKid != null) {
      data['tagKid'] = this.tagKid!.map((v) => v.toJson()).toList();
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

class TagKid {
  String? tagId;
  String? tagKidName;

  TagKid({this.tagId, this.tagKidName});

  TagKid.fromJson(Map<String, dynamic> json) {
    tagId = json['tagId'];
    tagKidName = json['tagKidName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagId'] = this.tagId;
    data['tagKidName'] = this.tagKidName;
    return data;
  }
}
