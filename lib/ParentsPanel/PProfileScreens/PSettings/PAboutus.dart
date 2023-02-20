import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:kidseau/Theme.dart';

import '../../../api/app_details_api/app_details_api.dart';

class PAboutus extends StatefulWidget {
  PAboutus({Key? key}) : super(key: key);

  @override
  State<PAboutus> createState() => _PAboutusState();
}

class _PAboutusState extends State<PAboutus> {
  bool _isLoading = false;
  String data = '';

  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() {
    _isLoading = true;
    final resp = AppDetailsApi().get(id: '1');
    resp.then((value) {
      log(value.toString());
      if (value['status'] == 1) {
        setState(() {
          data = value['appData'];
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 896.h,
      width: 414.w,
      child: Scaffold(
        extendBodyBehindAppBar: true,
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
          centerTitle: false,
          automaticallyImplyLeading: false,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff8267AC).withOpacity(0.16),
          ),
          backgroundColor: Color(0xff8267AC).withOpacity(0.16),
          title: Text(
            "About Us".tr(),
            style: FontConstant.k18w5008471Text,
          ),
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
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        HtmlWidget(
                          data,
                          textStyle: FontConstant.k16blackboldText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
