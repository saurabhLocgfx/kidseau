import 'package:flutter/material.dart';

Center mainlogo() {
  return Center(
      child: SizedBox(
          width: 174,
          height: 173,
          child: Image.asset('assets/images/logo.png')));
}

// class CustomBottomAppbar extends StatelessWidget {
//   final Color selectedColor;
//   final Color unSelectedColor;
//   final Function(int index) onTap;
//   final List<CustomBottomAppBarItem> children;
//   final int selectedTab;
//   const CustomBottomAppbar({
//     Key? key,
//     required this.selectedColor,
//     required this.unSelectedColor,
//     required this.onTap,
//     required this.children,
//     required this.selectedTab,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 32.0),
//       child: Container(
//         width: double.infinity,
//         height: 80,
//         padding: const EdgeInsets.symmetric(
//           vertical: 5,
//           horizontal: 10,
//         ),
//         color: Colors.transparent,
//         child: Container(
//           width: double.infinity,
//           height: 70,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 blurRadius: 20,
//                 color: Colors.grey.shade300,
//               )
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: List.generate(
//               children.length,
//               (index) {
//                 return CustomBottomAppBarItem(
//                   image: children[index].image,
//                   text: children[index].text,
//                   color: selectedTab == index ? selectedColor : unSelectedColor,
//                   press: () {
//                     onTap(index);
//                   },
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomBottomAppBarItem extends StatelessWidget {
//   final String image;
//   final String text;
//   final VoidCallback? press;
//   final Color? color;
//   const CustomBottomAppBarItem({
//     Key? key,
//     required this.image,
//     required this.text,
//     this.press,
//     this.color,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 image,
//                 height: 20,
//                 color: color == ThemeColor.primarycolor
//                     ? ThemeColor.primarycolor
//                     : ThemeColor.primarycolor,
//               ),
//               Text(
//                 text,
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                   color: color == ThemeColor.primarycolor
//                       ? ThemeColor.primarycolor
//                       : ThemeColor.primarycolor,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
