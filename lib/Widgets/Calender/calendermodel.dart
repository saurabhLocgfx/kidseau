import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
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
              AbsorbPointer(
                absorbing: true,
                child: TableCalendar(
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
                      todayBuilder: (_, a, b) =>
                          Center(child: Text(DateFormat('d').format(a)))),
                  selectedDayPredicate: (a) => false,
                  focusedDay: DateTime.now(),
                  firstDay:
                      DateTime(DateTime.now().year, DateTime.now().month, 1),
                  lastDay: DateTime(3033),
                ),
              ),
              SizedBox(height: 24),
              circlemarker(Colors.red, "Holidays"),
              SizedBox(height: 32),
              materialButton(
                context,
                () {
                  Navigator.pop(context);
                },
                'Close',
                ThemeColor.primarycolor,
                44.0,
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
