class NotificationResponse {
  NotificationResponse({
    required this.status,
    required this.allNotification,
  });
  late final int status;
  late final List<AllNotification> allNotification;

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    allNotification = List.from(json['all_notification'])
        .map((e) => AllNotification.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['all_notification'] = allNotification.map((e) => e.toJson()).toList();
    return data;
  }
}

class AllNotification {
  AllNotification({
    required this.id,
    required this.notification,
    required this.notificationType,
    required this.dateTime,
    required this.userIdFrom,
    required this.userTypeFrom,
    required this.url,
    required this.seen,
    required this.userTypeTo,
    required this.userIdTo,
  });
  late final String id;
  late final String notification;
  late final String notificationType;
  late final String dateTime;
  late final String userIdFrom;
  late final UserTypeFrom userTypeFrom;
  late final String url;
  late final String seen;
  late final String userTypeTo;
  late final String userIdTo;

  AllNotification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notification = json['notification'];
    notificationType = json['notification_type'];
    dateTime = json['date_time'];
    userIdFrom = json['user_id_from'];
    userTypeFrom = UserTypeFrom.fromJson(json['user_type_from']);
    url = json['url'].toString();
    seen = json['seen'];
    userTypeTo = json['user_type_to'];
    userIdTo = json['user_id_to'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['notification'] = notification;
    data['notification_type'] = notificationType;
    data['date_time'] = dateTime;
    data['user_id_from'] = userIdFrom;
    data['user_type_from'] = userTypeFrom.toJson();
    data['url'] = url;
    data['seen'] = seen;
    data['user_type_to'] = userTypeTo;
    data['user_id_to'] = userIdTo;
    return data;
  }
}

class UserTypeFrom {
  UserTypeFrom({
    required this.fName,
    required this.familyName,
    required this.techProfile,
    required this.gender,
  });
  late final String fName;
  late final String familyName;
  late final String techProfile;
  late final String gender;

  UserTypeFrom.fromJson(Map<String, dynamic> json) {
    fName = json['f_name'].toString();
    familyName = json['family_name'].toString();
    techProfile = json['tech_profile'].toString();
    gender = json['gender'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['f_name'] = fName;
    data['family_name'] = familyName;
    data['tech_profile'] = techProfile;
    data['gender'] = gender;
    return data;
  }
}
