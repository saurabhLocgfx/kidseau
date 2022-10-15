import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidseau/Theme.dart';

class HomeScreen extends StatelessWidget {

 HomeScreen({Key? key}) : super(key: key);
 var title = ["learning Alphabets","play game","Sound recognization","Rest"];
 var time =["From 08:00 - 09:00 am","From 09:15 - 10:00 am","From 09:15 - 10:00 am","From 09:15 - 10:00 am",];
 // List<String> images =["assets/images/book 1.png","assets/images/block 1.png","assets/images/music-player 1.png","assets/images/sleeping 1.png"];
 var images =["assets/images/book 1.png","assets/images/block 1.png","assets/images/music-player 1.png","assets/images/sleeping 1.png"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    //     appBar: PreferredSize(
    //     preferredSize: Size.fromHeight(104.0), // here the desired height
    // child: Column(
    //   children: [
    //
    //     Padding(
    //       padding: const EdgeInsets.only(top: 22.0),
    //       child: AppBar(
    //         backgroundColor: Color(0x2a8267ac),
    //         automaticallyImplyLeading: false,
    //         elevation: 0,
    //         title: Row(
    //           children: [
    //             Text("Good Morning",style: FontConstant.smalllightpurpleText,),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
    //
    // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 104.0,
              color: Color(0x2a8267ac),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                      children: [
                        Text("Good Morning",style: FontConstant.smalllightpurpleText.copyWith(fontSize: 25)),
                      ],
                  ),
                    )],
                ),
              ),
            ), // Goodmorning container
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 128,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(image: AssetImage("assets/images/Student Card.png"))
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
                                  Text("Nobite",style: FontConstant.simplewhiteText,),
                                  Text("Nursary sec A",style: FontConstant.simplewhiteText.copyWith
                                    (fontSize:14,fontWeight: FontWeight.w400,color: Colors.white.withOpacity(0.5))),
                                  Text("08:00 am to 01:00 pm",style: FontConstant.simplewhiteText.copyWith
                                    (fontSize:14,fontWeight: FontWeight.w400,color: Colors.white.withOpacity(0.5))),
                                  Text("2nd rank",style: FontConstant.simplewhiteText.copyWith
                                    (fontSize:16,fontWeight: FontWeight.w500,color: Colors.white.withOpacity(0.5))),


                                ],
                              ),
                            )


                          ],
                        ),
                      ),
                    ),
                    Container(
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
                          Text("Add",style: FontConstant.simplewhiteText.copyWith(fontSize: 16)),
                        ],
                      ),

                    ),


                  ],
                ),
                Text("Activity",style:FontConstant2.baloothampifont,),
                Container(
                  height: Get.size.height,
                  width: Get.size.width * 0.93,
                  child: ListView.builder(
                      itemCount: images.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index)
                      {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Container(
                            height: 64,
                            width: Get.size.width * 0.93,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Image.asset(images[index],height: 40,width: 40,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(title[index],style: FontConstant.headingText.copyWith(fontSize: 16),),
                                        Text(time[index],style: FontConstant.smalllightpurpleText.copyWith(
                                            fontWeight:FontWeight.w400,fontSize: 14,color: Color(0xffB7A4B2) ),)
                                      ],
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),






              ],
            ),

          ],
        ),
      ),
    );
  }
}
//