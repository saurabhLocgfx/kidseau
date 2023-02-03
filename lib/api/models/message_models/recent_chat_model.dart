class RecentMessageModel {
  String? userId;
  String? userName;
  String? userType;
  String? userProfile;
  String? messageTime;
  String? lang;

  RecentMessageModel(
      {this.userId,
      this.userName,
      this.userType,
      this.lang,
      this.userProfile,
      this.messageTime});

  RecentMessageModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    lang = json['lang'];
    userName = json['user_name'];
    userType = json['user_type'];
    userProfile = json['user_profile'];
    messageTime = json['message_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_type'] = this.userType;
    data['user_profile'] = this.userProfile;
    data['message_time'] = this.messageTime;
    return data;
  }
}
