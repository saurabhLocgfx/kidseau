import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/custom_snack_bar.dart';
import 'package:kidseau/Widgets/screen_loader.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_post_api/post_apis/teacher_announcement_api.dart';

class AddAnnouncement extends StatefulWidget {
  final Function(int) onPop;
  const AddAnnouncement({Key? key, required this.onPop}) : super(key: key);

  @override
  State<AddAnnouncement> createState() => _AddAnnouncementState();
}

class _AddAnnouncementState extends State<AddAnnouncement> {
  DateTime? _pickedDate;
  TimeOfDay? _pickedTime;
  String dobString = 'Select date (optional)';
  String timeString = 'Select time (optional)';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      color: Colors.white,
      child: Scaffold(
        backgroundColor: ThemeColor.primarycolor.withOpacity(0.06),
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          backgroundColor: ThemeColor.primarycolor.withOpacity(0.16),
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                toolbarHeight: 60,
                backgroundColor: ThemeColor.primarycolor.withOpacity(0.16),
                elevation: 0,
                automaticallyImplyLeading: false,
                centerTitle: false,
                title: Text('Add Announcement'.tr(),
                    style: FontConstant.k16w4008471Text),
                leading: Container(
                  width: 24,
                  height: 24,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  color: Colors.transparent,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/images/backarrow.png')),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Title".tr(),
                          /* AppLoaclizations.of(context)!
                              .translate("Title")
                              .toString(),*/
                          style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      TextFormField(
                        validator: (val) {
                          if (_titleController.text.isEmpty) {
                            return 'This field cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        controller: _titleController,
                        decoration: TextFieldDecoration().curvedWhiteDecoration(
                          curved: true,
                          label: 'Enter announcement\'s title',
                        ),
                      ),
                      SizedBox(height: 16),
                      Text("Description".tr(),
                          /*AppLoaclizations.of(context)!
                              .translate("Description")
                              .toString(),*/
                          style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      TextFormField(
                        validator: (val) {
                          if (_descController.text.isEmpty) {
                            return 'This field cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        controller: _descController,
                        maxLines: 6,
                        decoration: TextFieldDecoration().curvedWhiteDecoration(
                          curved: false,
                          label: 'Write here...',
                        ),
                      ),
                      SizedBox(height: 16),
                      Text("Time".tr(),
                          /*AppLoaclizations.of(context)!
                              .translate("Time")
                              .toString(),*/
                          style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      InkWell(
                        onTap: () async {
                          _pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(hour: 00, minute: 00));
                          if (_pickedTime == null) {
                            return;
                          } else {
                            // _dobControllerDay.text =
                            //     DateFormat('dd')
                            //         .format(_pickedDate!);
                            //
                            setState(() {
                              final now = DateTime.now();
                              final dt = DateTime(now.year, now.month, now.day,
                                  _pickedTime!.hour, _pickedTime!.minute);
                              timeString =
                                  DateFormat.Hms().format(dt); //"6:00 AM"
                            });
                            print(timeString);
                          }
                        },
                        child: Container(
                          width: 1.sw,
                          height: 56.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(90),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(timeString,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  )),
                              SizedBox(
                                width: 30,
                                child: Image.asset(
                                  'assets/images/appbarclock.png',
                                  color: ThemeColor.b7A4B2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text("Date".tr(),
                          /*AppLoaclizations.of(context)!
                              .translate("Date")
                              .toString(),*/
                          style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      InkWell(
                        onTap: () async {
                          _pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1970),
                              lastDate: DateTime(2100));
                          if (_pickedDate == null) {
                            return;
                          } else {
                            // _dobControllerDay.text =
                            //     DateFormat('dd')
                            //         .format(_pickedDate!);
                            //
                            setState(() {
                              dobString =
                                  DateFormat('yyyy-MM-dd').format(_pickedDate!);
                            });
                            //print(dobString);
                          }
                        },
                        child: Container(
                          width: 1.sw,
                          height: 56.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(90),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(dobString,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  )),
                              SizedBox(
                                width: 30,
                                child: Image.asset(
                                  'assets/images/calendericon.png',
                                  color: ThemeColor.b7A4B2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: materialButton(
            context,
            () {
              var isValid = _formKey.currentState!.validate();
              if (!isValid) {
                return;
              } else {
                ScreenLoader().onLoading(context);
                FocusScope.of(context).unfocus();
                final resp = TeacherAnnouncementApi().post(
                    title: _titleController.text,
                    desc: _descController.text,
                    time: timeString.contains(':') ? timeString : '',
                    date: dobString.contains('-') ? dobString : '');
                resp.then((value) {
                  log(value.toString());
                  Navigator.of(context).pop();
                  if (value['status'] == 1) {
                    CustomSnackBar.customSnackBar(context, value['msg']);
                    Navigator.of(context).pop();
                    widget.onPop(2);
                  } else {
                    CustomSnackBar.customErrorSnackBar(context, value['msg']);
                  }
                });
              }
            },
            "Announce".tr(),
            /*  AppLoaclizations.of(context)!.translate("Announce"),*/
            ThemeColor.primarycolor,
            52.0,
          ),
        ),
      ),
    );
  }
}
