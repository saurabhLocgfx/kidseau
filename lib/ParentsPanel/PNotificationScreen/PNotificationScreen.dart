import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/TeachersPanel/TReminder/AddReminder.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/widgets.dart';
import 'package:kidseau/api/models/notification_api_response/notification_api_response.dart';
import 'package:kidseau/api/notification_api/notification_api.dart';
import 'package:kidseau/models/noti_dis_model.dart';

class PNotificationScreen extends StatefulWidget {
  const PNotificationScreen({Key? key}) : super(key: key);

  @override
  State<PNotificationScreen> createState() => _PNotificationScreenState();
}

/*var images = [
  "assets/images/person6.png",
  "assets/images/person7.png",
  "assets/images/person8.png",
];
var title = [
  "Mohammad Umar has added new post",
  "Mohammad Umar has added new post",
  "Mohammad Umar has added new post",
];
var images2 = [
  "assets/images/person9.png",
  "assets/images/person10.png",
];
var title2 = [
  "Mohammad Umar has added new post",
  "Mohammad Umar has added new post",
];
var desc = [
  "Anouncement",
  "Anouncement",
  "Anouncement",
];
var desc2 = [
  "Anouncement",
  "Anouncement",
];*/

class _PNotificationScreenState extends State<PNotificationScreen> {
  List notifications = [];
  List<dynamic> notiDis = [];
  // List<AllNotificationModel> dis = [];
  List<AllNotificationModel> dis = [];
  List<Dis> img = [];

  var _value;
  int page = 0;
  var response = NotificationResponse(status: 0, allNotification: []);
  getNotifications() {
    setState(() {
      loading = true;
    });
    NotificationApi().getNotifications(page).then(
      (value) {
        log(value.toString());
        notifications.clear();

        for (var v in value['all_notification']) {
          if (v['notification_type'] == 'post') {
            dis.add(AllNotificationModel.fromJson(v));
            // notiDis = v['dis'];
            // notiDis.add(v['dis']);
            // for (var q in v['dis']) {
            //   dis.add(NotificationDisModel.fromJson(q));
            // }
            // dis.add(NotificationDisModel(v['dis']));
          }
        }

        print('check img${img.length}');
        if (value['status'] == 1) {
          notifications.clear();
          response = NotificationResponse.fromJson(value);
          for (int i = 0; i < response.allNotification.length; i++) {
            notifications
                .add(response.allNotification[i].seen == '0' ? false : true);
          }
          setState(() {
            loading = false;
          });
        } else {
          setState(() {
            loading = false;
          });
        }
      },
    );
  }

  @override
  void initState() {
    getNotifications();
    super.initState();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(
        190,
        116,
        170,
        0.08,
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.0,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ThemeColor.lightpurple.withOpacity(0.16),
          ),
          backgroundColor: Color(0xff8267AC).withOpacity(0.16),
          centerTitle: false,
          title: GestureDetector(
            onTap: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => MessageScreen()));
            },
            child: Text("Notification".tr(),
                style: FontConstant2.k32w5008267text.copyWith(fontSize: 32.sp)),
          ),
          actions: [
            Notificationpopup(
              onMarkAllRead: () {
                Navigator.pop(context);
                setState(() {
                  loading = true;
                });
                List a = [];
                for (int i = 0; i < response.allNotification.length; i++) {
                  a.add(response.allNotification[i].id);
                }
                NotificationApi().readNotification(a).then((value) {
                  if (value['status'] == 1) {
                    /*setState(() {
                      loading = false;
                    });*/
                  }
                }).then((value) {
                  getNotifications();
                });
              },
              image: "assets/images/markicon.png",
              title: "Mark all as read".tr(),
              image2: "assets/images/gearicon.png",
              title2: "Notification settings".tr(),
            ),
          ],
        ),
        body: Stack(
          children: [
            notifications.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        getNotifications();
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: notifications.length,
                        itemBuilder: (_, i) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (notifications.length == 1)
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Text(
                                      DateFormat('dd MMM, yyyy').format(
                                                  DateTime.parse(response
                                                      .allNotification[i]
                                                      .dateTime
                                                      .toString())) ==
                                              DateFormat('dd MMM, yyyy')
                                                  .format(DateTime.now())
                                          ? 'Today'
                                          : DateFormat('dd MMM, yyyy').format(
                                              DateTime.parse(response
                                                  .allNotification[i].dateTime
                                                  .toString())),
                                      style: FontConstant.k14w500B7A4Text,
                                    ),
                                  ),
                                ),
                              if (i == 0 && notifications.length > 1)
                                if (DateTime.parse(response
                                        .allNotification[i].dateTime
                                        .toString()) !=
                                    DateTime.parse(response
                                        .allNotification[i + 1].dateTime
                                        .toString()))
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Text(
                                        DateFormat('dd MMM, yyyy').format(
                                                    DateTime.parse(response
                                                        .allNotification[i]
                                                        .dateTime
                                                        .toString())) ==
                                                DateFormat('dd MMM, yyyy')
                                                    .format(DateTime.now())
                                            ? 'Today'.tr()
                                            : DateFormat('dd MMM, yyyy').format(
                                                DateTime.parse(response
                                                    .allNotification[i].dateTime
                                                    .toString())),
                                        style: FontConstant.k14w500B7A4Text,
                                      ),
                                    ),
                                  ),
                              if (i != 0)
                                if (DateTime.parse(response
                                        .allNotification[i].dateTime
                                        .toString()) ==
                                    DateTime.parse(response
                                        .allNotification[i - 1].dateTime
                                        .toString()))
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Text(
                                        DateFormat('dd MMM, yyyy').format(
                                                    DateTime.parse(response
                                                        .allNotification[i]
                                                        .dateTime
                                                        .toString())) ==
                                                DateFormat('dd MMM, yyyy')
                                                    .format(DateTime.now())
                                            ? 'Today'.tr()
                                            : DateFormat('dd MMM, yyyy').format(
                                                DateTime.parse(response
                                                    .allNotification[i].dateTime
                                                    .toString())),
                                        style: FontConstant.k14w500B7A4Text,
                                      ),
                                    ),
                                  ),
                              SizedBox(height: 2),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    loading = true;
                                  });
                                  NotificationApi().readNotification([
                                    response.allNotification[i].id
                                  ]).then((value) {
                                    if (value['status'] == 1) {
                                      setState(() {
                                        loading = false;
                                      });
                                      response.allNotification[i]
                                                  .notificationType ==
                                              'post'
                                          ? //Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => PPostNotificationScreen(value: response.allNotification[i].,)));
                                          showDialog(
                                              context: context,
                                              builder: (_) => PostDialog(
                                                    captions: dis[i]
                                                        .notification
                                                        .toString(),
                                                    dis: dis[i]
                                                        .dis!
                                                        .images!
                                                        .toList(),
                                                  ))
                                          : notificationDialog(
                                              context: context,
                                              title: response.allNotification[i]
                                                  .notificationType,
                                              desc: response
                                                  .allNotification[i].dis,
                                              onAddReminderTap: () {
                                                setState(() {
                                                  notifications[i] = true;
                                                });
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (_) =>
                                                        TAddReminder(
                                                      title: response
                                                          .allNotification[i]
                                                          .notification,
                                                      onPop: () {},
                                                    ),
                                                  ),
                                                );
                                              },
                                              onPop: () {
                                                getNotifications();
                                              },
                                            );
                                    } else {
                                      Fluttertoast.showToast(msg: 'Error');
                                    }
                                  });
                                },
                                child: Container(
                                  color: notifications[i]
                                      ? Colors.transparent
                                      : ThemeColor.primarycolor
                                          .withOpacity(0.16),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 16),
                                      Container(
                                        width: 60,
                                        height: 70,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 16),
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(08),
                                        ),
                                        child: Image.network(
                                          response.allNotification[i]
                                              .userTypeFrom.techProfile,
                                          fit: BoxFit.cover,
                                          errorBuilder: (_, a, b) => Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(08),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/person3.png"))),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            response.allNotification[i]
                                                .userTypeFrom.fName
                                                .trim(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: FontConstant.k16w500331FText,
                                          ),
                                          Text(
                                            response.allNotification[i]
                                                .notificationType
                                                .trim(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: FontConstant.k16w500331FText
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                          Text(
                                            DateFormat('hh:mm a').format(
                                                DateTime.parse(response
                                                    .allNotification[i]
                                                    .dateTime)),
                                            style: FontConstant.k14w5008471Text,
                                          ),
                                          Text(response
                                              .allNotification[i].notification)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              if (i != response.allNotification.length - 1)
                                if (DateTime.parse(response
                                        .allNotification[i].dateTime
                                        .toString()) ==
                                    DateTime.parse(response
                                        .allNotification[i + 1].dateTime
                                        .toString()))
                                  SizedBox(height: 16),
                            ],
                          );
                        },
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 100.h),
                        child: Center(
                            child: Image.asset(
                          "assets/images/nonotification.png",
                          width: 200,
                          height: 200,
                        )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Oops!".tr(),
                        style: FontConstant2.k24w5008267text,
                      ),
                      Text(
                        "You don’t have any notification".tr(),
                        style: FontConstant.k16w4008471Text,
                      ),
                      /* Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Today".tr(),
                    style: FontConstant.k14w500B7A4Text,
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  // height: 99,
                  // width: 414,
                  color: ThemeColor.primarycolor.withOpacity(0.16),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      children: [
                        Container(
                          height: 67,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(08),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/person3.png"))),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50,
                                child: Text(
                                  "Mohammad Umar has added new post",
                                  style: FontConstant.k16w500331FText,
                                ),
                              ),
                              Text(
                                "2 hours ago.",
                                style: FontConstant.k14w5008471Text,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2),
                GestureDetector(
                  onTap: () {
                    notificationdialog(context);
                    // AnnouncementDialog(context);
                  },
                  child: Container(
                    */ /* height: 99,
                    width: 414,*/ /*
                    color: ThemeColor.primarycolor.withOpacity(0.16),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        children: [
                          Container(
                            height: 67,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(08),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/person4fm.png"))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200.w,
                                  child: Text(
                                    "Please bring Alphabet notebook tomorrow.",
                                    style: FontConstant.k16w500331FText,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Announcement",
                                      style: FontConstant.k14w5008471Text,
                                    ),
                                    SizedBox(width: 08),
                                    Center(
                                      child: Icon(
                                        Icons.circle,
                                        size: 3,
                                        color: Color(0xffB7A4B2),
                                      ),
                                    ),
                                    SizedBox(width: 06),
                                    Text(
                                      "2 hours ago.",
                                      style: FontConstant.k14w5008471Text,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Plist1(),
                // list1(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Yesterday",
                    style: FontConstant.k14w500B7A4Text,
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Plist2(),
                ),*/
                    ],
                  )),
            if (loading)
              Container(
                  width: 1.sw,
                  height: 1.sh,
                  color: Colors.white.withOpacity(0.7),
                  child: Center(child: CircularProgressIndicator())),
          ],
        ),
      ),
    );
  }
}
