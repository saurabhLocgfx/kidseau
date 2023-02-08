class HolidayApiModel {
  int? status;
  List<AllHoliday>? allHoliday;

  HolidayApiModel({this.status, this.allHoliday});

  HolidayApiModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['allHoliday'] != null) {
      allHoliday = <AllHoliday>[];
      json['allHoliday'].forEach((v) {
        allHoliday!.add(new AllHoliday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.allHoliday != null) {
      data['allHoliday'] = this.allHoliday!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllHoliday {
  String? holidayId;
  String? holidayDate;
  String? holidayDisc;

  AllHoliday({this.holidayId, this.holidayDate, this.holidayDisc});

  AllHoliday.fromJson(Map<String, dynamic> json) {
    holidayId = json['holiday_id'];
    holidayDate = json['holiday_date'];
    holidayDisc = json['holiday_disc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['holiday_id'] = this.holidayId;
    data['holiday_date'] = this.holidayDate;
    data['holiday_disc'] = this.holidayDisc;
    return data;
  }
}
