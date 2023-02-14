class RecentMessageModel {
  String? userId;
  String? userName;
  String? userType;
  String? userProfile;
  String? messageTime;
  String? lang;
  String? msgUnread;

  RecentMessageModel(
      {this.userId,
      this.userName,
      this.userType,
      this.lang,
      this.userProfile,
      this.msgUnread,
      this.messageTime});

  RecentMessageModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    lang = json['lang'];
    userName = json['user_name'];
    userType = json['user_type'];
    userProfile = json['user_profile'];
    messageTime = json['message_time'];
    msgUnread = json['msg_unread'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_type'] = this.userType;
    data['user_profile'] = this.userProfile;
    data['message_time'] = this.messageTime;
    data['msg_unread'] = this.msgUnread;
    return data;
  }
}
