class ParentPostModel {
  String? postId;
  String? teacherImage;
  String? teacherName;
  String? postTime;
  String? postDate;
  String? postCaption;
  int? like;
  int? likeStatus;
  List<Images>? images;

  ParentPostModel(
      {this.postId,
      this.teacherImage,
      this.teacherName,
      this.postTime,
      this.postDate,
      this.postCaption,
      this.like,
      this.likeStatus,
      this.images});

  ParentPostModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    teacherImage = json['teacherImage'];
    teacherName = json['teacherName'];
    postTime = json['postTime'];
    postDate = json['postDate'];
    postCaption = json['postCaption'];
    like = json['like'];
    likeStatus = json['likeStatus'];
    if (json['Images'] != null) {
      images = <Images>[];
      json['Images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['teacherImage'] = this.teacherImage;
    data['teacherName'] = this.teacherName;
    data['postTime'] = this.postTime;
    data['postDate'] = this.postDate;
    data['postCaption'] = this.postCaption;
    data['like'] = this.like;
    data['likeStatus'] = this.likeStatus;
    if (this.images != null) {
      data['Images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? fileId;
  String? fileName;

  Images({this.fileId, this.fileName});

  Images.fromJson(Map<String, dynamic> json) {
    fileId = json['file_id'];
    fileName = json['file_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file_id'] = this.fileId;
    data['file_name'] = this.fileName;
    return data;
  }
}
