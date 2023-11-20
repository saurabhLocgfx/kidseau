// class AllNotificationModel {
//   String? id;
//   String? notification;
//   String? notificationType;
//   String? dataId;
//   String? dateTime;
//   String? userIdFrom;
//   UserTypeFrom? userTypeFrom;
//   String? seen;
//   String? userTypeTo;
//   String? userIdTo;
//   Dis? dis;
//
//   AllNotificationModel(
//       {this.id,
//       this.notification,
//       this.notificationType,
//       this.dataId,
//       this.dateTime,
//       this.userIdFrom,
//       this.userTypeFrom,
//       this.seen,
//       this.userTypeTo,
//       this.userIdTo,
//       this.dis});
//
//   AllNotificationModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     notification = json['notification'];
//     notificationType = json['notification_type'];
//     dataId = json['data_id'];
//     dateTime = json['date_time'];
//     userIdFrom = json['user_id_from'];
//     userTypeFrom = json['user_type_from'] != null
//         ? new UserTypeFrom.fromJson(json['user_type_from'])
//         : null;
//     seen = json['seen'];
//     userTypeTo = json['user_type_to'];
//     userIdTo = json['user_id_to'];
//     dis = json['dis'] != null ? new DisImg.fromJson(json['dis']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['notification'] = this.notification;
//     data['notification_type'] = this.notificationType;
//     data['data_id'] = this.dataId;
//     data['date_time'] = this.dateTime;
//     data['user_id_from'] = this.userIdFrom;
//     if (this.userTypeFrom != null) {
//       data['user_type_from'] = this.userTypeFrom!.toJson();
//     }
//     data['seen'] = this.seen;
//     data['user_type_to'] = this.userTypeTo;
//     data['user_id_to'] = this.userIdTo;
//     if (this.dis != null) {
//       data['dis'] = this.dis!.toJson();
//     }
//     return data;
//   }
// }
//
// class UserTypeFrom {
//   String? fName;
//   String? familyName;
//   String? techProfile;
//   String? gender;
//
//   UserTypeFrom({this.fName, this.familyName, this.techProfile, this.gender});
//
//   UserTypeFrom.fromJson(Map<String, dynamic> json) {
//     fName = json['f_name'];
//     familyName = json['family_name'];
//     techProfile = json['tech_profile'];
//     gender = json['gender'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['f_name'] = this.fName;
//     data['family_name'] = this.familyName;
//     data['tech_profile'] = this.techProfile;
//     data['gender'] = this.gender;
//     return data;
//   }
// }
