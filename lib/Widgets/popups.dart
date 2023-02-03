import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';

class popuptextfield extends StatefulWidget {
  const popuptextfield({
    Key? key,
    required bool isVisible,
  })  : _isVisible = isVisible,
        super(key: key);

  final bool _isVisible;

  @override
  State<popuptextfield> createState() => _popuptextfieldState();
}

class _popuptextfieldState extends State<popuptextfield> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget._isVisible,
      child: Container(
        height: 115.h,
        width: 382.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 12,
              color: Color.fromRGBO(93, 61, 143, 0.2),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(62.0),
              topRight: Radius.circular(97.0),
              bottomRight: Radius.circular(97.0)),
        ),
        child: Container(
          height: 67.h,
          width: 382.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/micicon.png",
                        height: 24.h,
                      ),
                      Text(
                        "Voice note".tr(),
                        /*AppLoaclizations.of(context)!
                            .translate("Voice note")
                            .toString(),*/
                        style: FontConstant.k16w5008471Text,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/galleryicon.png",
                        height: 24.h,
                      ),
                      Text(
                        "Gallery".tr(),
                        /*AppLoaclizations.of(context)!
                            .translate("Gallery")
                            .toString(),*/
                        style: FontConstant.k16w5008471Text,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/contacticon.png",
                        height: 24.h,
                      ),
                      Text(
                        "Contact".tr(),
                        /* AppLoaclizations.of(context)!
                            .translate("Contact")
                            .toString(),*/
                        style: FontConstant.k16w5008471Text,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
