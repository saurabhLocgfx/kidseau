import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidseau/OnboardingScreens/onboardingscreencontroller.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/widgets.dart';


class Onboarding1Screen extends StatelessWidget {
  final _controller = OnboardingController();
  Onboarding1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8267ac),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.asset("images/Artboard 1 1.png"),
            Container(
              height: Get.size.height *0.30,
              width: Get.size.width,
              decoration: BoxDecoration(
                color: Colors.transparent,),
              child: Image.asset("assets/images/Artboard 1 1.png",fit: BoxFit.cover,),
            ),
            Container(
              height: Get.size.height *0.70,
              width: Get.size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        PageView.builder(
                            controller: _controller.pageController,
                            onPageChanged: _controller.selectedPageIndex,
                            itemCount: _controller.onboardingPages.length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Column(
                                  children: [
                                    SizedBox(height:Get.size.height * 0.03),
                                    Image.asset(
                                        _controller.onboardingPages[index].imageAsset,height: 320,),
                                    SizedBox(height: 10),
                                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _controller.onboardingPages[index].title,
                                                style: FontConstant.headingText,
                                              ),
                                               Padding(
                                                 padding: const EdgeInsets.only(top: 0.0),
                                                 child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: [
                                                     Column(mainAxisAlignment: MainAxisAlignment.start,
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: [
                                                         Text(
                                                          _controller.onboardingPages[index].description,
                                                          textAlign: TextAlign.center,
                                                          style: FontConstant.lightText,
                                              ),
                                                       ],
                                                     ),
                                                   ],
                                                 ),
                                               ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              );
                            }),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: Row(
                            children: List.generate(
                              _controller.onboardingPages.length,
                                  (index) => Obx(() {
                                return Container(
                                  margin: const EdgeInsets.all(4),
                                  width: 16,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: _controller.selectedPageIndex.value == index
                                        ? Color(0xfff0ad56)
                                        : Color(0xfffbebd6),
                                    borderRadius: BorderRadius.circular(10)
                                    
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Positioned(
                              right:0,
                                bottom: 0,
                                child: Stack(
                                    children: [
                                      Image.asset("assets/images/Vector (1) - Copy.png"),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 85.0,left: 28),
                                        child: MaterialButton(
                                          minWidth: 25,
                                          onPressed: _controller.forwardAction,
                                            child: Icon(_controller.isLastPage ? Icons.arrow_forward_outlined:Icons.arrow_forward_outlined),),
                                      ),
                                      
                                    ],)),

                            // Positioned(
                            //   right: 20,
                            //   bottom: 20,
                            //   child: FloatingActionButton(
                            //     elevation: 0,
                            //     onPressed: _controller.forwardAction,
                            //     child: Obx(() {
                            //       return Text(_controller.isLastPage ? 'Start' : 'Next');
                            //     }),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Column(
                  //   children: [
                  //     Center(
                  //       child: Stack(children: [
                  //         Center(
                  //           child: Image.asset("assets/images/Frame 12373.png",height: 230,
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(top: 30.0),
                  //           child: Center(child: Image.asset("assets/images/Layer 2.png",height: 180,)),
                  //         ),
                  //       ],),
                  //     ),
                  //     SizedBox(height: Get.size.height *0.03,),
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  //       child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Column(crossAxisAlignment: CrossAxisAlignment.start,
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: [
                  //             Text("Watch your kid growing",style: FontConstant.headingText,),
                  //               Padding(
                  //                 padding: const EdgeInsets.only(top: 13.0),
                  //                 child: Text("Know what is your kid is doing in School and track their\nactivities.",
                  //                   style: FontConstant.lightText,),
                  //               )
                  //           ],),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Row(crossAxisAlignment: CrossAxisAlignment.end,
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Stack(
                  //         children: [
                  //           Image.asset("assets/images/Vector (1) - Copy.png"),
                  //           Padding(
                  //             padding: const EdgeInsets .only(top: 90.0,left: 30),
                  //             child: Icon(Icons.arrow_forward,color: Colors.white,),
                  //           )
                  //
                  //         ], ),
                  //   ],
                  // )

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
