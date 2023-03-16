import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

class NoInternet extends StatefulWidget {
  final Function onRetryTap;
  const NoInternet({Key? key, required this.onRetryTap}) : super(key: key);

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Stack(
          children: [
            Image.asset('assets/images/bg23.png'),
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 240,
                      height: 270,
                      child: Image.asset('assets/images/no.png'),
                    ),
                    SizedBox(height: 40),
                    Text(
                      '404',
                      style: FontConstant2.baloo500_18_8267AC.copyWith(
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'No Internet Connection!'.tr(),
                      style: FontConstant2.k24w500331Ftext,
                    ),
                    Text(
                      'Please try again.'.tr(),
                      style: FontConstant.k16w5008471,
                    ),
                    Spacer(),
                    materialButton(context, () {
                      widget.onRetryTap();
                    }, 'Retry', AppColors().k8267AC, 56.0),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
