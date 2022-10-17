import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidseau/Theme.dart';

class KidsInformation extends StatefulWidget {
  const KidsInformation({Key? key}) : super(key: key);

  @override
  State<KidsInformation> createState() => _KidsInformationState();
}

class _KidsInformationState extends State<KidsInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
        child: Column(
          children: [
            AppBar(
              backgroundColor: Color(0x2a8267ac),
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset("assets/images/arrow-left.png",height:24,width: 24,)),
                  Padding(
                    padding: const EdgeInsets.only(left: 17.93),
                    child: Text("Back",style: FontConstant.k14w400lightpurpleText.copyWith(
                        fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xff84717F))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text("Kid's information",style: FontConstant.k,)



          ],
        ),
      ),

    );
  }
}
