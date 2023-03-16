import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/ParentsPanel/PSignUpScreen/Parentinfodashboard.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';
import 'package:kidseau/Widgets/widgets.dart';
import 'package:kidseau/api/models/voucher_video_model/voucher_video_model.dart';
import 'package:kidseau/api/parent_panel_apis/parent_voucher_video_api/parent_voucher_video_api.dart';
import 'package:kidseau/api/parent_signup_apis/voucher_code_api.dart';
import 'package:video_player/video_player.dart';

import '../PProfileScreens/parent_add_new_kid_screens/add_new_kid_details.dart';

class PSignupCode extends StatefulWidget {
  final bool newKid;
  PSignupCode({Key? key, required this.newKid}) : super(key: key);

  @override
  State<PSignupCode> createState() => _PSignupCodeState();
}

class _PSignupCodeState extends State<PSignupCode> {
  final TextEditingController voucherCodeText = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  VoucherVideoModel model = VoucherVideoModel();
  bool _isLoading = false;
  _getData() {
    _isLoading = true;
    final resp = ParentVoucherVideoApi().get();
    resp.then((value) {
      log(value.toString());
      if (value['status'] == 1) {
        setState(() {
          model = VoucherVideoModel.fromJson(value);
          _isLoading = false;
        });
      } else {
        setState(() {
          model = VoucherVideoModel(appVideo: []);
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 896.h,
      width: 414.w,
      child: Scaffold(
        backgroundColor: Color(0xfff7f6fa),
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
            statusBarColor: Color(0xff8267AC).withOpacity(0.16),
          ),
          backgroundColor: Color(0xff8267AC).withOpacity(0.16),
          leading: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/images/backarrow.png",
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        extendBody: true,
        bottomNavigationBar: Container(
          width: 382.w,
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 16),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white54,
                blurRadius: 16,
              )
            ],
          ),
          child: SingleChildScrollView(
            child: MainButton(
                onTap: widget.newKid
                    ? () {
                        if (_formKey.currentState!.validate()) {
                          final resp = VoucherCode()
                              .get(Vouchercode: voucherCodeText.text);
                          resp.then((value) {
                            print(value);
                            if (value['status'] == 0) {
                              Fluttertoast.showToast(msg: value['msg']);
                              Navigator.pop(context);
                            } else {
                              if (value['status'] == 1) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ParentAddNewKidDetail(
                                          newKid: widget.newKid,
                                        )));
                              } else if (value['status'] == 2) {
                                Navigator.pop(context);
                              }
                              //navigate to
                              //UserPrefs.setCookies(value['key']);
                              /**/
                              /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PDashboard()),
                                    );*/
                              /*Fluttertoast.showToast(
                                        msg: 'Your OTP is ${value['voucher']}');*/
                            }
                          });
                          print(voucherCodeText.text);
                        }
                      }
                    : () {
                        if (_formKey.currentState!.validate()) {
                          final resp = VoucherCode()
                              .get(Vouchercode: voucherCodeText.text);
                          resp.then((value) {
                            print(value);
                            if (value['status'] == 0) {
                              Fluttertoast.showToast(msg: value['msg']);
                            } else {
                              //navigate to
                              //UserPrefs.setCookies(value['key']);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Parentinfodashboard()));
                              /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PDashboard()),
                                    );*/
                              /*Fluttertoast.showToast(
                                        msg: 'Your OTP is ${value['voucher']}');*/
                            }
                          });
                          print(voucherCodeText.text);
                        }
                      }
                // Navigator.push(
                //   context,
                // MaterialPageRoute(
                //     builder: (context) => Informationfill()),
                // );
                ,
                title: "Continue".tr(),
                textStyleColor: Colors.white,
                backgroundColor: ThemeColor.primarycolor),
          ),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      width: 1.sw,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/bg23.png"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Form(
                        key: _formKey,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              mainlogo(),
                              SizedBox(height: 08),
                              Center(
                                child: Text(
                                  "We offer a new way to track your children and watch them grow"
                                      .tr(),
                                  style: FontConstant.k16w4008471Text,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 24),
                              Text(
                                "Voucher’s code".tr(),
                                style: FontConstant.k16w500331FText,
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 5),
                              Container(
                                //height: 56.h,
                                width: 1.sw,
                                child: TextFormField(
                                  validator: (voucherCode) {
                                    if (voucherCode == null ||
                                        voucherCode.isEmpty) {
                                      return 'Enter Voucher code'.tr();
                                    }
                                    return null;
                                  },
                                  controller: voucherCodeText,
                                  style: FontConstant.k18w5008471Text,
                                  decoration: CustomInputDecoration(
                                          hintText:
                                              "Enter your Voucher’s code".tr())
                                      .decoration(),
                                  /*  controller: controller,*/
                                ),
                              ),
                              SizedBox(height: 04),
                              Padding(
                                padding: const EdgeInsets.only(left: 14.0),
                                child: Text(
                                  "Vouchers are given by kid’s school".tr(),
                                  style: FontConstant.k14w400B7A4Text,
                                ),
                              ),
                              SizedBox(height: 25),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return VoucherVideoDialog(model: model);
                                      });
                                },
                                child: Center(
                                  child: Container(
                                    height: 214.h,
                                    // width: 382.w,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              model.appVideo![0].vPoster
                                                  .toString(),
                                            ),
                                            fit: BoxFit.fitWidth)),
                                    child: Center(
                                      child: Image.asset(
                                        "assets/images/play.png",
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                    /* Image.network(
                                         ??
                                            '',
                                        errorBuilder: (q, w, e) => Image.asset(
                                            "assets/images/laptopbackgroundplay.png",
                                            fit: BoxFit.fitWidth),
                                      ) Center(
                                  child: Image.asset(
                              "assets/images/playicon.png",
                              height: 46,
                              width: 46,
                            )),*/
                                  ),
                                ),
                              ),
                              SizedBox(height: 100),
                              /*SizedBox(
                                height: 40,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: ,
                              ),*/
                              /*SizedBox(height: 13.h),*/
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class VoucherVideoDialog extends StatefulWidget {
  final VoucherVideoModel model;
  const VoucherVideoDialog({Key? key, required this.model}) : super(key: key);

  @override
  State<VoucherVideoDialog> createState() => _VoucherVideoDialogState();
}

class _VoucherVideoDialogState extends State<VoucherVideoDialog>
    with TickerProviderStateMixin {
  late VideoPlayerController controller;

  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
        widget.model.appVideo![0].video.toString())
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    //controller.value.duration;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(
      begin: 1,
      end: 2,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _animation2 = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      content: GestureDetector(
        onTap: () {
          setState(() {
            playing = !playing;
            if (playing) {
              controller.play();
              _animationController.forward();
            } else {
              _animationController.reverse();
              controller.pause();
            }
          });
        },
        child: Container(
          width: 1.sw,
          height: 250,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  // Use the VideoPlayer widget to display the video.
                  child: VideoPlayer(controller),
                ),
              ),
              //VideoPlayer(controller),
              Center(
                child: FadeTransition(
                  opacity: _animation2,
                  child: ScaleTransition(
                    scale: _animation,
                    child: Container(
                      color: Colors.black54,
                      width: 100,
                      height: 100,
                      child: Icon(
                        playing ? Icons.pause_circle : Icons.play_circle,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
