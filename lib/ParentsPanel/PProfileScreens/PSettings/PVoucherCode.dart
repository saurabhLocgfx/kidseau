import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PSettings/PChangeVoucherScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/models/parent_models/parent_profile_models/kid_voucher_detail_model.dart';
import 'package:kidseau/api/parent_panel_apis/parent_profile_apis/parent_get_app_vouchers_api.dart';

class PVouchercode extends StatefulWidget {
  PVouchercode({Key? key}) : super(key: key);

  @override
  State<PVouchercode> createState() => _PVouchercodeState();
}

class _PVouchercodeState extends State<PVouchercode> {
  @override
  void initState() {
    _getData();
    _startLoading();
    super.initState();
  }

  List<KidVoucherDetailModel> modelList = [];
  bool _isLoading = false;
  _getData() {
    _isLoading = true;
    final resp = ParentGetAllVouchers().get();
    resp.then((value) {
      setState(() {
        for (var v in value) {
          modelList.add(KidVoucherDetailModel.fromJson(v));
        }
        _isLoading = false;
      });
    });
  }

  bool loading = true;
  _startLoading() {
    // Simulate a delay of 2 seconds
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        // Stop loading after 2 seconds
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 896.h,
      width: 1.sw,
      child: Scaffold(
          // extendBodyBehindAppBar: true,
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
            title: Text(
              "Voucher Code".tr(),
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
          body: loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : (modelList.isEmpty || modelList == null)
                  ? Center(
                      child: Text(
                      "No voucher Code yet",
                      style: FontConstant.k18w5008471Text,
                    ))
                  : _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : SingleChildScrollView(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                SizedBox(height: 16),
                                MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  child: ListView.separated(
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PChangeVoucherScreen(
                                                onPop: () {
                                                  _getData();
                                                },
                                                kidId: modelList[index]
                                                    .kidId
                                                    .toString(),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              height: 93.h,
                                              width: 1.sw,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/vouchercard.png"),
                                                      fit: BoxFit.cover)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            "Current Code".tr(),
                                                            style: FontConstant
                                                                .k16w4008471Text
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white)),
                                                        Text("Valid till".tr(),
                                                            style: FontConstant
                                                                .k16w4008471Text
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white)),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                            modelList[index]
                                                                .currentCode
                                                                .toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: FontConstant2
                                                                .k24w5008267text
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ),
                                                        modelList[index]
                                                                    .validTill
                                                                    .toString() ==
                                                                ""
                                                            ? Text('')
                                                            : Text(
                                                                DateFormat
                                                                        .yMMM()
                                                                    .format(DateTime.parse(modelList[
                                                                            index]
                                                                        .validTill
                                                                        .toString())),
                                                                style: FontConstant
                                                                    .k18w500331FText
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .white),
                                                              ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Issued by".tr(),
                                                  style: FontConstant
                                                      .k16w400331FText,
                                                ),
                                                Text(
                                                  modelList[index]
                                                      .issuedBy
                                                      .toString(),
                                                  style: FontConstant
                                                      .k16w4008471Text,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 12),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Issued date".tr(),
                                                  style: FontConstant
                                                      .k16w400331FText,
                                                ),
                                                Text(
                                                  modelList[index]
                                                      .issuedData
                                                      .toString()
                                                      .split(' ')
                                                      .first,
                                                  style: FontConstant
                                                      .k16w4008471Text,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 12),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Issued for".tr(),
                                                  style: FontConstant
                                                      .k16w400331FText,
                                                ),
                                                Text(
                                                  modelList[index]
                                                      .issuedFor
                                                      .toString(),
                                                  style: FontConstant
                                                      .k16w4008471Text,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (ctx, ind) => Divider(
                                      color: AppColors().bgColor,
                                      thickness: 2,
                                    ),
                                    itemCount: modelList.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                  ),
                                ),
                                /*Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 52,
                        width: 382,
                        child: MainButton(
                            onTap: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => changevouchercode(),
                              //   ),
                              // );
                            },
                            title: "Change Voucher Code".tr(),
                            textStyleColor: Colors.white,
                            backgroundColor: ThemeColor.primarycolor),
                      ),
                    ),
                  ),*/
                                SizedBox(
                                  height: 50,
                                )
                              ],
                            ),
                          ),
                        )),
    );
  }
}
