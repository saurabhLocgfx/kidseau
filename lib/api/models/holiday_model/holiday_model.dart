class HolidayApiModel {
  int? status;
  List<AllHoliday>? allHoliday;

  HolidayApiModel({this.status, this.allHoliday});

  HolidayApiModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['allHoliday'] != null) {
      allHoliday = <AllHoliday>[];
      json['allHoliday'].forEach((v) {
        allHoliday!.add(AllHoliday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (allHoliday != null) {
      data['allHoliday'] = allHoliday!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['holiday_id'] = holidayId;
    data['holiday_date'] = holidayDate;
    data['holiday_disc'] = holidayDisc;
    return data;
  }
}
