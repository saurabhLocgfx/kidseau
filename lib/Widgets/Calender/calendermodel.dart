import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/holiday_api/holiday_api.dart';
import 'package:kidseau/api/models/holiday_model/holiday_model.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage2 extends StatefulWidget {
  const CalendarPage2({super.key});

  @override
  _CalendarPage2State createState() => _CalendarPage2State();
}

List<DateTime> presentDates = [
  DateTime(2022, 11, 1),
  DateTime(2022, 11, 2),
  DateTime(2022, 11, 3),
  DateTime(2022, 11, 4),
  DateTime(2022, 11, 5),
  DateTime(2022, 11, 6),
  DateTime(2022, 11, 9),
  DateTime(2022, 11, 10),
  DateTime(2022, 11, 11),
  DateTime(2022, 11, 15),
  DateTime(2022, 11, 22),
  DateTime(2022, 11, 23),
];
List<DateTime> absentDates = [
  DateTime(2022, 11, 12),
  DateTime(2022, 11, 13),
];

class _CalendarPage2State extends State<CalendarPage2> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    getDate();
    super.initState();
  }

  getDate() {
    setState(() {
      _selectedDay = UserPrefs.getDate() != null
          ? DateTime.parse(UserPrefs.getDate()!)
          : DateTime.now();
    });
  }

  setPrefs(DateTime dateTime) {
    UserPrefs.setDate(dateTime.toString());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Container(
        padding: EdgeInsets.all(32),
        width: 1.sw,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TableCalendar(
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: FontConstant.k18w500BlackText,
                  titleTextFormatter: (a, b) => DateFormat('MMMM').format(a),
                  leftChevronMargin: EdgeInsets.zero,
                  rightChevronMargin: EdgeInsets.zero,
                ),
                daysOfWeekHeight: 30,
                daysOfWeekStyle: DaysOfWeekStyle(
                  dowTextFormatter: (a, b) => DateFormat('E').format(a),
                  weekdayStyle: GoogleFonts.balooDa2(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF6FC96F),
                  ),
                  weekendStyle: GoogleFonts.balooDa2(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF6FC96F),
                  ),
                ),
                calendarBuilders: CalendarBuilders(
                    todayBuilder: (_, a, b) => Center(
                          child: Text(DateFormat('d').format(a)),
                        ),
                    selectedBuilder: (_, a, b) => Container(
                          decoration: BoxDecoration(
                            color: AppColors().k8267AC,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              DateFormat('d').format(a),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                selectedDayPredicate: (a) {
                  return isSameDay(_selectedDay, a);
                },
                onDaySelected: (a, b) {
                  setState(() {
                    _selectedDay = a;
                    _focusedDay = b;
                  });
                  setPrefs(a);
                  Navigator.pop(context);
                },
                focusedDay: DateTime.now(),
                firstDay:
                    DateTime(DateTime.now().year, DateTime.now().month - 1, 1),
                lastDay: DateTime.now(),
              ),
              //SizedBox(height: 24),
              /*circlemarker(
                Colors.red,
                "Holidays".tr(),
              ),*/
              /*AppLoaclizations.of(context)!
                      .translate("Holidays")
                      .toString()),*/
              SizedBox(height: 32),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                enableFeedback: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                height: 44,
                minWidth: MediaQuery.of(context).size.width * 0.92,
                elevation: 0,
                color: AppColors().kF8F6FA,
                child: Text(
                  "Close".tr(),
                  style: FontConstant.k16w500purpleText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget circlemarker(Color color, String data) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 10,
        ),
        SizedBox(width: 16),
        Text(
          data,
        ),
      ],
    );
  }
}

class CalendarPage3 extends StatefulWidget {
  const CalendarPage3({Key? key}) : super(key: key);

  @override
  State<CalendarPage3> createState() => _CalendarPage3State();
}

class _CalendarPage3State extends State<CalendarPage3> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  List holidays = [];

  @override
  void initState() {
    getDates();
    super.initState();
  }

  HolidayApiModel model = HolidayApiModel();

  getDates() {
    final resp = HolidayApi().get().then((value) {
      print(value);
      if (value['status'] == 1) {
        setState(() {
          model = HolidayApiModel.fromJson(value);
          for (var v in model.allHoliday!) {
            holidays.add(v.holidayDate);
          }
        });
      } else {
        Fluttertoast.showToast(msg: 'Error');
        Navigator.pop(context);
      }
    });
  }

  setPrefs(DateTime dateTime) {
    UserPrefs.setDate(dateTime.toString());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Container(
        padding: EdgeInsets.all(32),
        width: 1.sw,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  TableCalendar(
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: FontConstant.k18w500BlackText,
                      titleTextFormatter: (a, b) =>
                          DateFormat('MMMM').format(a),
                      leftChevronMargin: EdgeInsets.zero,
                      rightChevronMargin: EdgeInsets.zero,
                    ),
                    daysOfWeekHeight: 30,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      dowTextFormatter: (a, b) => DateFormat('E').format(a),
                      weekdayStyle: GoogleFonts.balooDa2(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF6FC96F),
                      ),
                      weekendStyle: GoogleFonts.balooDa2(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF6FC96F),
                      ),
                    ),
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (_, a, b) => Center(
                        child: Text(
                          DateFormat('d').format(a),
                          style: TextStyle(
                            color: holidays.contains(
                                    DateFormat('yyyy-MM-dd').format(a))
                                ? Colors.red
                                : Colors.black,
                          ),
                        ),
                      ),
                      todayBuilder: (_, a, b) => Center(
                        child: Text(
                          DateFormat('d').format(a),
                          style: TextStyle(
                              color: holidays.contains(
                                      DateFormat('yyyy-MM-dd').format(a))
                                  ? Colors.red
                                  : Colors.black),
                        ),
                      ),
                      /*selectedBuilder: (_, a, b) => Container(
                        decoration: BoxDecoration(
                          color: AppColors().k8267AC,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            DateFormat('d').format(a),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),*/
                    ),
                    selectedDayPredicate: (a) => false,
                    /*onDaySelected: (a, b) {
                      setState(() {
                        _selectedDay = a;
                        _focusedDay = b;
                      });
                      setPrefs(a);
                      Navigator.pop(context);
                    },*/
                    focusedDay: DateTime.now(),
                    firstDay: DateTime(DateTime.now().year, 1, 1),
                    lastDay: DateTime(DateTime.now().year + 1),
                  ),
                  if (holidays.isEmpty)
                    Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          //border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 16,
                            ),
                          ],
                        ),
                        child: Center(child: CircularProgressIndicator())),
                ],
              ),
              SizedBox(height: 24),
              circlemarker(
                Colors.red,
                "Holidays".tr(),
              ),
              /*AppLoaclizations.of(context)!
                      .translate("Holidays")
                      .toString()),*/
              SizedBox(height: 32),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                enableFeedback: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                height: 44,
                minWidth: MediaQuery.of(context).size.width * 0.92,
                elevation: 0,
                color: AppColors().kF8F6FA,
                child: Text(
                  "Close".tr(),
                  style: FontConstant.k16w500purpleText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget circlemarker(Color color, String data) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 10,
        ),
        SizedBox(width: 16),
        Text(
          data,
        ),
      ],
    );
  }
}
