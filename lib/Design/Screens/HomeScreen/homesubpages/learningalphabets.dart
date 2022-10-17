import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

class LearningAplphabets extends StatefulWidget {
  const LearningAplphabets({Key? key}) : super(key: key);

  @override
  State<LearningAplphabets> createState() => _LearningAplphabetsState();
}

class _LearningAplphabetsState extends State<LearningAplphabets> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.size.height,
        decoration: BoxDecoration(
        color: Color.fromRGBO(190, 116, 170, 0.08),),
      child: Scaffold(
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
                      child: Text("Good Morning",style: FontConstant.k14w400lightpurpleText.copyWith(
                          fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xff84717F))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Align(alignment: Alignment.topCenter,
                    child: Text("Learning Alphabets",style: FontConstant.k16w500brownText.copyWith(fontSize:32 ),
                    ),
                ),
                Column(
                  children: [
                    Container(
                      height: 286,
                      width: 382,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            image: AssetImage("assets/images/Rectangle for la.png"))
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/clock.png",height: 20,width: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 06.0),
                          child: Text("09:00am to 11:00am",style: FontConstant.k14w400lightpurpleText.copyWith(fontSize: 16,fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),


                  ],
                ),
                SizedBox(height: 24),
                Text("Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud.",
                    style: FontConstant.k14w400lightpurpleText.copyWith(fontWeight: FontWeight.w400,fontSize: 18)),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text("Who is taking this class",style: FontConstant2.baloothampifont,)),
                SizedBox(height: 24),
                Container(
                  height: 128,
                  width: 382,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/Teacher card leaarning ap.png"))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          height: 96,
                          width: 72,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(image: AssetImage("assets/images/leaning alp person.png")),
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Mohammad Umar",style: FontConstant.k18w500whiteText,),
                            Text("Class teacher",style: FontConstant.k18w500whiteText.copyWith(
                              fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white.withOpacity(0.6),
                            )),
                            Text("Class teacher",style: FontConstant.k18w500whiteText.copyWith(
                              fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white.withOpacity(0.74),
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 32,),
                materialButton(context, () {}, "Ask Question", ThemeColor.primarycolor, 52.0),
                SizedBox(height: 56),


              ],
            ),
          ),
        ),


      ),
    );
  }
}
