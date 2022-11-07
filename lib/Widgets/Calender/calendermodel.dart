import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class CalendarPage2 extends StatefulWidget {
  @override
  _CalendarPage2State createState() => new _CalendarPage2State();
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
  DateTime _currentDate2 = DateTime.now();
  // static Widget _presentIcon(String day) => CircleAvatar(
  //       backgroundColor: Colors.white,
  //       child: Text(
  //         day,
  //         style: TextStyle(
  //           color: Colors.black,
  //         ),
  //       ),
  //     );
  // static Widget _absentIcon(String day) => CircleAvatar(
  //       backgroundColor: Colors.white,
  //       child: Text(
  //         day,
  //         style: TextStyle(
  //           color: Colors.red,
  //         ),
  //       ),
  //     );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  late CalendarCarousel _calendarCarouselNoHeader;

  var len = min(absentDates.length, presentDates.length);
  late double cHeight;

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;

    // for (int i = 0; i < len!; i++) {
    //   _markedDateMap.add(
    //     absentDates[i],
    //     new Event(
    //       date: absentDates[i],
    //       title: 'Event 5',
    //       icon: _absentIcon(
    //         absentDates[i].day.toString(),
    //       ),
    //     ),
    //   );
    // }

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: cHeight * 0.54,
      weekendTextStyle: TextStyle(
        color: Colors.black,
      ),
      todayButtonColor: Colors.blue,
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal:
          null, // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                _calendarCarouselNoHeader,
                circlemarker(Colors.red, "Holidays"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget circlemarker(Color color, String data) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        radius: 22,
      ),
      title: new Text(
        data,
      ),
    );
  }
}
