import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/TLearningAlphabets.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/Teacherpanelapi/Tmodel/THomemodel.dart';
import 'package:kidseau/api/Teacherpanelapi/Tmodel/TScheduleModel.dart';
import 'package:kidseau/api/Teacherpanelapi/Tschedule_api/schedule_api.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_home_api/THomeApi.dart';

class schedulewidgetapi extends StatefulWidget {
  const schedulewidgetapi({Key? key}) : super(key: key);

  @override
  State<schedulewidgetapi> createState() => _schedulewidgetapiState();
}

class _schedulewidgetapiState extends State<schedulewidgetapi> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    loadingData = true;
    final rsp = THomeApi().get();
    rsp.then((value) {
      try {
        setState(() {
          loadingData = false;
        });
        _name = value as THomeModel;
      } catch (e) {
        setState(() {
          loadingData = false;
        });
      }
      print(_name.hello);
      //print(_name.group);
      //print(_name.group!.length);
    });
  }

 /* getSchedule() {
    loadingsch = true;
    final rsp = TScheduleApi().get();
    rsp.then((value) {
      try {
        _schedule = value;
        setState(() {
          loadingsch = false;
        });
      } catch (e) {
        setState(() {
          loadingsch = false;
        });
      }
      print(_schedule.schedule);
    });
  }*/

  bool loadingsch = false;
  bool loadingData = false;
  THomeModel _name = THomeModel();
  TScheduleModel _schedule = TScheduleModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: loadingData
          ? CircularProgressIndicator()
          : SizedBox(
              // height: 300.h,
              width: 1.sw,
              child: ListView.separated(
                  separatorBuilder: (ctx, ind) => SizedBox(
                        height: 14.h,
                      ),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _name.schdule!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TLearningAlphabets(scheduleID: '',)),
                          );
                        } else if (index == 1) {
                        } else if (index == 2) {
                        } else if (index == 3) {}
                      },
                      child: loadingData
                          ? CircularProgressIndicator()
                          : Container(
                              height: 64,
                              // width: Get.size.width * 0.93,
                              //margin: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      _name.schdule![index].actIcon.toString(),
                                      errorBuilder: (q, w, e) {
                                        return Text('Image not loaded');
                                      },
                                      height: 40,
                                      width: 40,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _name.schdule![index].actTitle
                                                .toString(),
                                            style: FontConstant.k32w500blackText
                                                .copyWith(fontSize: 16),
                                          ),
                                          Row(
                                            children: [
                                              Text(_name.schdule![index].grpName.toString(),style: FontConstant
                                                  .k14w400lightpurpleText
                                                  .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Color(0xffB7A4B2)),),
                                              SizedBox(width: 5,),
                                              Container(
                                                width: 3,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffB7A4B2),
                                                    shape: BoxShape.circle
                                                ),
                                              ),
                                              SizedBox(width: 5,),
                                              Text(
                                                "From ${_name.schdule![index].timing!.split('-').first} ",
                                                // '${groups[index]} . ${time[index]}',
                                                style: FontConstant
                                                    .k14w400lightpurpleText
                                                    .copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: Color(0xffB7A4B2)),
                                              ),
                                              Text(
                                                "To ${_name.schdule![index].timing!.split('-').last}",
                                                // '${groups[index]} . ${time[index]}',
                                                style: FontConstant
                                                    .k14w400lightpurpleText
                                                    .copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: Color(0xffB7A4B2)),
                                              ),
                                            ],
                                          )
                                          /*Row(
                                            children: [
                                              Text(
                                                "From ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse('${_name.schdule![index].time}'))} ",
                                                // '${groups[index]} . ${time[index]}',
                                                style: FontConstant
                                                    .k14w400lightpurpleText
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xffB7A4B2)),
                                              ),
                                              Text(
                                                "To ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse('${_name.schdule![index].time}'))} ",
                                                // '${groups[index]} . ${time[index]}',
                                                style: FontConstant
                                                    .k14w400lightpurpleText
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xffB7A4B2)),
                                              ),
                                            ],
                                          )*/
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    );
                  }),
            ),
    );
  }
}
