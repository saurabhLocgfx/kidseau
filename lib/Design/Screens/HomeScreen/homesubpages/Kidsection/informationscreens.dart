// class InformationScreen extends StatefulWidget {
//   const InformationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<InformationScreen> createState() => _InformationScreenState();
// }

// class _InformationScreenState extends State<InformationScreen> {
//   int pageIndex = 0;
//   final controller = PageController(initialPage: 1);
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   PageController _pageController = PageController(
//     initialPage: 0,
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//       children: [
//         SizedBox(height: 124),
//         Pageviewtabprofile(),
//         Expanded(
//           child: PageView(
//             physics: PageScrollPhysics(),
//             controller: _pageController,
//             onPageChanged: (page) {
//               setState(
//                 () {
//                   pageIndex = page;
//                 },
//               );
//             },
//             children: <Widget>[KidsInformation(), MedicalInformation()],
//           ),
//         ),
//       ],
//     ));
//   }
//
//   Container Pageviewtabprofile() {
//     return Container(
//       height: 56.h,
//       width: 248.w,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(76),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 pageIndex = 0;
//               });
//             },
//             child: Container(
//               child: Row(
//                 children: [
//                   Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(93),
//                         color:
//                             pageIndex == 0 ? Color(0xffEBE6F2) : Colors.white),
//                     child: Center(
//                       child: Image.asset(
//                           pageIndex == 0
//                               ? "assets/images/messageiconfill.png"
//                               : "assets/images/messageicon.png",
//                           height: 24),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 4.0),
//                     child: Text("Message",
//                         style: FontConstant.k14w500B7A4Text.copyWith(
//                             color: pageIndex == 0
//                                 ? Color(0xff8267AC)
//                                 : Color(0xffB7A4B2))),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(width: 10),
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 pageIndex = 1;
//               });
//             },
//             child: Row(
//               children: [
//                 Text("Teacher",
//                     style: FontConstant.k14w500B7A4Text.copyWith(
//                         color: pageIndex == 1
//                             ? Color(0xff8267AC)
//                             : Color(0xffB7A4B2))),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 4.0),
//                   child: Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(93),
//                         color:
//                             pageIndex == 1 ? Color(0xffEBE6F2) : Colors.white),
//                     child: Center(
//                       child: Image.asset(
//                           pageIndex == 1
//                               ? "assets/images/Teachericonfill.png"
//                               : "assets/images/Teachericon.png",
//                           height: 24),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
