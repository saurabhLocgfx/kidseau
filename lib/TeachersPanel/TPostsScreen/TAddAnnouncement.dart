import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

class AddAnnouncement extends StatefulWidget {
  const AddAnnouncement({Key? key}) : super(key: key);

  @override
  State<AddAnnouncement> createState() => _AddAnnouncementState();
}

class _AddAnnouncementState extends State<AddAnnouncement> {
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
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: materialButton(
            context,
            () {},
            "Announce".tr(),
            /*  AppLoaclizations.of(context)!.translate("Announce"),*/
            ThemeColor.primarycolor,
            52.0,
          ),
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
                title: Text('Add Announcement',
                    style: FontConstant.k16w4008471Text),
                leading: Container(
                  width: 24,
                  height: 24,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  color: Colors.transparent,
                  child: Image.asset('assets/images/backarrow.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
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
                      onTap: () {
                        showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: 00, minute: 00));
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
                            Text('8:45 am',
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
                      onTap: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1970),
                            lastDate: DateTime(2100));
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
                            Text('dd/mm/yyyy',
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
            ],
          ),
        ),
      ),
    );
  }
}
