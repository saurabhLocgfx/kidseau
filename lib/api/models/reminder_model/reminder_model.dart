class ReminderModel {
  String? id;
  String? title;
  String? remTime;
  String? remDate;

  ReminderModel({this.id, this.title, this.remTime, this.remDate});

  ReminderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    remTime = json['rem_time'];
    remDate = json['rem_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['rem_time'] = this.remTime;
    data['rem_date'] = this.remDate;
    return data;
  }
}
