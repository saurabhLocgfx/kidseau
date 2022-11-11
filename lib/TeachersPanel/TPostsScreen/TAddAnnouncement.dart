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
            'Announce',
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
                    Text('Title', style: FontConstant.k16w500331FText),
                    SizedBox(height: 4),
                    TextFormField(
                      decoration: TextFieldDecoration().curvedWhiteDecoration(
                        curved: true,
                        label: 'Enter reminder\'s title',
                      ),
                    ),
                    SizedBox(height: 16),
                    Text('Description', style: FontConstant.k16w500331FText),
                    SizedBox(height: 4),
                    TextFormField(
                      maxLines: 6,
                      decoration: TextFieldDecoration().curvedWhiteDecoration(
                        curved: false,
                        label: 'Write here...',
                      ),
                    ),
                    SizedBox(height: 16),
                    Text('Time', style: FontConstant.k16w500331FText),
                    SizedBox(height: 4),
                    Container(
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
                          Text('8:45 am'),
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
                    SizedBox(height: 16),
                    Text('Date', style: FontConstant.k16w500331FText),
                    SizedBox(height: 4),
                    Container(
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
                          Text('dd/mm/yyyy'),
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
