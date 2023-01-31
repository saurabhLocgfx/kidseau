import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PHomeScreen.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PKidsdetail.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PSettings/PVoucherCode.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/p_edit_profile.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/api/models/parent_models/parent_profile_models/parent_profile_model.dart';
import 'package:kidseau/api/parent_panel_apis/parent_profile_apis/parent_profile_api.dart';

import '../PSignUpScreen/PSignupCodeScreen.dart';
import 'parent_add_new_kid_screens/add_new_kid_details.dart';

class PParentsProfile extends StatefulWidget {
  const PParentsProfile({Key? key}) : super(key: key);

  @override
  State<PParentsProfile> createState() => _PParentsProfileState();
}

class _PParentsProfileState extends State<PParentsProfile> {
  var infocategory = [
    "Mother’s name",
    "Occupation",
    "Email address",
    "Phone number",
    "Address",
  ];

  var infocategorydata = [
    "Lucy Bravo",
    "House Wife",
    "Ab@gmail.com",
    "9876543210",
    "6391 Elgin St. Celina,"
  ];

  @override
  void initState() {
    _getDetails();
    super.initState();
  }

  ParentProfileModel model = ParentProfileModel();

  bool _isLoading = false;
  _getDetails() {
    _isLoading = true;
    final resp = ParentProfileApi().get();
    resp.then((value) {
      if (value['status'] == 1) {
        setState(() {
          model = ParentProfileModel.fromJson(value);
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 140,
                        width: 96.2,
                        child: Image.network(
                          model.parentImage.toString(),
                          errorBuilder: (q, w, e) =>
                              Image.asset("assets/images/profileperson.png"),
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            model.fatherName.toString(),
                            style: FontConstant.k24w500brownText,
                          ),
                          Text(
                            model.foccupation.toString(),
                            style: FontConstant.k16w400B7A4Text,
                          ),
                          Text(model.number.toString(),
                              style: FontConstant.k16w5008471Text),
                          Text(model.email.toString(),
                              style: FontConstant.k16w5008471Text),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    height: 132,
                    padding: EdgeInsets.only(left: 16),
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (index >= model.kid!.length) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => PSignupCode(
                                          newKid: true,
                                        )));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                    color: Color(0xffD9D9D9),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add),
                                    Text(
                                      'Add kid'.tr(),
                                      style: FontConstant.k18w500BlackText,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return InkWell(
                              child: Container(
                                width: 260,
                                decoration: BoxDecoration(
                                  //color: Colors.black,
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/Student Card.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 96,
                                      width: 72,
                                      child: Image.network(
                                        model.kid![index].profilePic.toString(),
                                        errorBuilder: (q, w, e) => Image.asset(
                                            "assets/images/Rectangle 2715.png"),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          model.kid![index].name.toString(),
                                          style: FontConstant.k16w500White,
                                        ),
                                        Text(
                                          model.kid![index].grpName.toString(),
                                          style: FontConstant.k14w400White,
                                        ),
                                        Text(
                                          "${"From".tr()} ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(model.kid![index].schTimeIn.toString().split('.').first))} ${"To".tr()} ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(model.kid![index].schTimeOut.toString().split('.').first))}",
                                          style: FontConstant.k12w400White,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PKidsDetails(
                                      kidId: model.kid![index].kidId.toString(),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        separatorBuilder: (ctx, ind) => SizedBox(
                              width: 10,
                            ),
                        itemCount: model.kid!.length + 1),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "info".tr(),
                        style: FontConstant2.k22w5008471text,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 130,
                            child: Text(
                              "Mother's name".tr(),
                              style: FontConstant.k16w500331FText,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              model.motherName.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: FontConstant.k16w5008471Text,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 130,
                            child: Text(
                              "Occupation".tr(),
                              style: FontConstant.k16w500331FText,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              model.mOccupation.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: FontConstant.k16w5008471Text,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 130,
                            child: Text(
                              "Email address".tr(),
                              style: FontConstant.k16w500331FText,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              model.motherEmail.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: FontConstant.k16w5008471Text,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 130,
                            child: Text(
                              "Phone Number".tr(),
                              style: FontConstant.k16w500331FText,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              model.motherPhoneNumber.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: FontConstant.k16w5008471Text,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 130,
                            child: Text(
                              "Address".tr(),
                              style: FontConstant.k16w500331FText,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              model.parentAddress.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: FontConstant.k16w5008471Text,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 52,
                    width: 1.sw,
                    child: MainButton(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => PEditProfileScreen(
                                    model: model,
                                    onPop: () {
                                      _getDetails();
                                    },
                                  )));
                        },
                        title: "Edit".tr(),
                        textStyleColor: Colors.white,
                        backgroundColor: ThemeColor.primarycolor),
                  ),
                ),
              ],
            ),
    );
  }
}
