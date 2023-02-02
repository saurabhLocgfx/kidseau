class AllMessagesModel {
  int? status;
  List<AllMsg>? allMsg;

  AllMessagesModel({this.status, this.allMsg});

  AllMessagesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['allMsg'] != null) {
      allMsg = <AllMsg>[];
      json['allMsg'].forEach((v) {
        allMsg!.add(new AllMsg.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.allMsg != null) {
      data['allMsg'] = this.allMsg!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllMsg {
  String? messageId;
  String? message;
  String? fileUrl;
  String? createdAt;
  String? readAt;
  String? sendToId;
  String? isDeleted;
  String? senderUserType;
  String? recieverUserType;

  AllMsg(
      {this.messageId,
      this.message,
      this.fileUrl,
      this.createdAt,
      this.readAt,
      this.sendToId,
      this.isDeleted,
      this.senderUserType,
      this.recieverUserType});

  AllMsg.fromJson(Map<String, dynamic> json) {
    messageId = json['message_id'];
    message = json['message'];
    fileUrl = json['file_url'];
    createdAt = json['created_at'];
    readAt = json['read_at'];
    sendToId = json['send_to_id'];
    isDeleted = json['is_deleted'];
    senderUserType = json['sender_user_type'];
    recieverUserType = json['reciever_user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message_id'] = this.messageId;
    data['message'] = this.message;
    data['file_url'] = this.fileUrl;
    data['created_at'] = this.createdAt;
    data['read_at'] = this.readAt;
    data['send_to_id'] = this.sendToId;
    data['is_deleted'] = this.isDeleted;
    data['sender_user_type'] = this.senderUserType;
    data['reciever_user_type'] = this.recieverUserType;
    return data;
  }
}
