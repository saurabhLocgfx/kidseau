import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kidseau/Theme.dart';

class BarChartSample1 extends StatefulWidget {
  final List<dynamic> activityList;
  BarChartSample1({super.key, required this.activityList});

  List<Color> get availableColors => const <Color>[
        Colors.yellow,
        Colors.red,
        Colors.purple,
        Colors.blue,
        Colors.tealAccent,
        Colors.lightGreen,
      ];

  final Color barBackgroundColor = Color(0xff8267AC).withOpacity(0.28);
  final Color barColor = Color(0xff8267AC);
  final Color touchedBarColor = Colors.yellow.shade200;

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: BarChart(
                    mainBarData(),
                    swapAnimationDuration: animDuration,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          /*Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: AppColors.contentColorGreen,
                  ),
                  onPressed: () {
                    setState(() {
                      isPlaying = !isPlaying;
                      if (isPlaying) {
                        refreshState();
                      }
                    });
                  },
                ),
              ),
            )*/
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    // int x,
    // double y,
    // double z, {
    // bool isTouched = false,
    // Color? barColor,
    // double width = 10,
    // List<int> showTooltips = const [],
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 14,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: widget.touchedBarColor)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20, //z
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  // List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
  //       switch (i) {
  //         case 0:
  //           return makeGroupData(0, 5, isTouched: i == touchedIndex);
  //         case 1:
  //           return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
  //         case 2:
  //           return makeGroupData(2, 5, isTouched: i == touchedIndex);
  //         case 3:
  //           return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
  //         case 4:
  //           return makeGroupData(4, 9, isTouched: i == touchedIndex);
  //         case 5:
  //           return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
  //         case 6:
  //           return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
  //         default:
  //           return throw Error();
  //       }
  //     });

  List<BarChartGroupData> showingGroups() =>
      List.generate(widget.activityList.length, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
                i, double.parse(widget.activityList[0].pfmSum!),
                isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(
                i, double.parse(widget.activityList[1].pfmSum!),
                isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(
                i, double.parse(widget.activityList[2].pfmSum!),
                isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(
                i, double.parse(widget.activityList[3].pfmSum!),
                isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(
                i, double.parse(widget.activityList[4].pfmSum!),
                isTouched: i == touchedIndex);
          // case 5:
          //   return makeGroupData(
          //       i, double.parse(widget.activityList[i].pfmSum!),
          //       isTouched: i == touchedIndex);
          // case 6:
          //   return makeGroupData(
          //       i, double.parse(widget.activityList[i].pfmSum!),
          //       isTouched: i == touchedIndex);
          // case 1:
          //   return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
          // case 2:
          //   return makeGroupData(2, 5, isTouched: i == touchedIndex);
          // case 3:
          //   return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
          // case 4:
          //   return makeGroupData(4, 9, isTouched: i == touchedIndex);
          // case 5:
          //   return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
          // case 6:
          //   return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
        // return makeGroupData(i, double.parse(widget.activityList[i].pfmSum!),
        //     double.parse(widget.activityList[i].totalSub!),
        //     isTouched: i == touchedIndex);
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        /*touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.blueGrey,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'Monday';
                break;
              case 1:
                weekDay = 'Tuesday';
                break;
              case 2:
                weekDay = 'Wednesday';
                break;
              case 3:
                weekDay = 'Thursday';
                break;
              case 4:
                weekDay = 'Friday';
                break;
              case 5:
                weekDay = 'Saturday';
                break;
              case 6:
                weekDay = 'Sunday';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: TextStyle(
                    color: widget.touchedBarColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),*/
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTopTitles,
            reservedSize: 38,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    final style = FontConstant.k14w400lightpurpleText;
    Widget text;
    text = Text(
        widget.activityList[value.toInt()].actName![0].toUpperCase() +
            widget.activityList[value.toInt()].actName![1].toUpperCase(),
        style: style);
    /*switch (value.toInt()) {
      case 0:
        text = const Text('M', style: style);
        break;
      case 1:
        text = const Text('T', style: style);
        break;
      case 2:
        text = const Text('W', style: style);
        break;
      case 3:
        text = const Text('T', style: style);
        break;
      case 4:
        text = const Text('F', style: style);
        break;
      case 5:
        text = const Text('S', style: style);
        break;
      case 6:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }*/
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  Widget getTopTitles(double value, TitleMeta meta) {
    final style = FontConstant.k14w400lightpurpleText;
    Widget text;
    text = Text('${(int.parse(widget.activityList[value.toInt()].pfmSum!))}',

        // '${(int.parse(widget.activityList[value.toInt()].pfmSum!)}',
        // '${(int.parse(widget.activityList[value.toInt()].pfmSum!) / int.parse(widget.activityList[value.toInt()].totalSub!)) * 100}%',
        style: style);
    /*switch (value.toInt()) {
      case 0:
        text = const Text('10', style: style);
        break;
      case 1:
        text = const Text('20', style: style);
        break;
      case 2:
        text = const Text('30', style: style);
        break;
      case 3:
        text = const Text('40', style: style);
        break;
      case 4:
        text = const Text('50', style: style);
        break;
      case 5:
        text = const Text('60', style: style);
        break;
      case 6:
        text = const Text('70', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }*/
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  /*BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
              0,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 1:
            return makeGroupData(
              1,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 2:
            return makeGroupData(
              2,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 3:
            return makeGroupData(
              3,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 4:
            return makeGroupData(
              4,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 5:
            return makeGroupData(
              5,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 6:
            return makeGroupData(
              6,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          default:
            return throw Error();
        }
      }),
      gridData: FlGridData(show: false),
    );
  }*/

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}
