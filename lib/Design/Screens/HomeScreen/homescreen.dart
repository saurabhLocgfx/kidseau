import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homebody/activity.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homebody/tutorials.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homesubpages/Kidsection/addkid.dart';
import 'package:kidseau/Theme.dart';

class HomeScreen extends StatefulWidget {

 HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height,
      decoration: BoxDecoration(
        color: Color.fromRGBO(190, 116, 170, 0.08),
      ),
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
                Text("Good Morning",style: FontConstant.k14w400lightpurpleText.copyWith(fontSize: 25)),
              ],
            ),
          ),
        ],
      ),
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   height: 104.0,
              //   color: Color(0x2a8267ac),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //     child: Row(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(top: 50),
              //           child: Row(
              //           children: [
              //             Text("Good Morning",style: FontConstant.smalllightpurpleText.copyWith(fontSize: 25)),
              //           ],
              //       ),
              //         )],
              //     ),
              //   ),
              // ), // Goodmorning container
              //students cards
              Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 128,
                        width: 283,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffAD9CC9
                                ),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(image: AssetImage("assets/images/Student_Card-remove.png"))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Container(
                                height:96,
                                width: 72,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("assets/images/Rectangle 2715.png"))
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0,top: 10),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Nobite",style: FontConstant.k18w500whiteText,),
                                    Text("Nursary sec A",style: FontConstant.k18w500whiteText.copyWith
                                      (fontSize:14,fontWeight: FontWeight.w400,color: Colors.white.withOpacity(0.5))),
                                    Text("08:00 am to 01:00 pm",style: FontConstant.k18w500whiteText.copyWith
                                      (fontSize:14,fontWeight: FontWeight.w400,color: Colors.white.withOpacity(0.5))),
                                    Text("2nd rank",style: FontConstant.k18w500whiteText.copyWith
                                      (fontSize:16,fontWeight: FontWeight.w500,color: Colors.white.withOpacity(0.5))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(()=>Addkid());

                        },
                        child: Container(
                          height: 128,
                          width: 83,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(image: AssetImage("assets/images/Rectangle 2716.png"))
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: Get.size.height * 0.05,),
                              Icon(Icons.add,size: 25,color: Colors.white,),
                              Text("Add",style: FontConstant.k18w500whiteText.copyWith(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.size.height *0.01,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child:
                    Column(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Activity",style:FontConstant2.baloothampifont,),

                        Activity(),

                        Center(
                          child: Text("see more",style:FontConstant.k16w500purpleText.copyWith(
                            fontSize: 18,
                          )),
                        ),
                        Text("Tutorials",style:FontConstant2.baloothampifont,),




                      ],
                    ),
                  )

                ],
              ),
              Tutorials(),
              //Tutorials card



            SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
//