import 'package:flutter/material.dart';
import 'package:kidseau/Constants/text_style.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PSettings/Deleted_successfully.dart';
import 'package:kidseau/TeachersPanel/TProfileScreen/Parent_deleted_successfully.dart';
import 'package:kidseau/api/delete_account_api/delete_api.dart';
import 'package:kidseau/api/message_apis/delete_message_api.dart';

import '../../../Constants/colors.dart';
 class DeleteModalSheet extends StatelessWidget {
   const DeleteModalSheet({super.key});
 
   @override
   Widget build(BuildContext context) {
     return /*Container(
         height: 250,
        decoration: BoxDecoration(
         color: Colors.white,
           borderRadius: BorderRadius.only(
               topLeft:Radius.circular(24) ,
               topRight: Radius.circular(24))
       ),

       child:*/ SizedBox(
       height: 250,
         child: Column(
           children: [
Container(
   height: 80,
  width: MediaQuery.of(context).size.width,
  decoration: BoxDecoration(
    color: kFDE3E3,
    borderRadius: BorderRadius.only(
            topLeft:Radius.circular(24) ,
    topRight: Radius.circular(24))
  ),
  padding: EdgeInsets.all(20),
  //EdgeInsets.only(bottom: 12,left: 16,top: 32,right: 16),
  child: Row(
    children: [
   CircleAvatar(

         child: Image.asset('assets/images/white_trash.png',height: 24,),
   backgroundColor: kF97070,),
            SizedBox(width: 8,),
            Text('Delete Account?',
          style: k24_500_F97070,
            )
    ],
  ),
),
             SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(text: 'Are You sure you want to delete this',style: k16_400_516770),
                    TextSpan(text: ' “Account”',style: k16_400_331F2D),
                    TextSpan(text: ' ? You won’t able to retrieve your data.',style: k16_400_516770)

                  ])
               ),
            ),
             SizedBox(height: 24,),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child:   Row(children: [
    GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(


            decoration:BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
            ),
            padding: EdgeInsets.symmetric(vertical: 12),


            child: Text('No',style: k18_500_166B8E,textAlign: TextAlign.center),
            height: 55,
           width: 160,
          ),
    ),
    SizedBox(width: 8,),
    GestureDetector(
          onTap: (){
deleteApi().then((value) {
if(value['status'] == 1){
  showDialog(

      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: AlertDialog(

          backgroundColor: Colors.transparent,

          elevation: 0,
          contentPadding: EdgeInsets.all(12),
          insetPadding: EdgeInsets.all(16),

          content: ParentSuccessfullyDeletedScreen(),
        ),
      )



  );
}
else{}
});


          },
          child: Container(
            decoration:BoxDecoration(
            color: kF97070,
            borderRadius: BorderRadius.circular(8)
            ),
            padding: EdgeInsets.symmetric(vertical: 12),


            child: Text('Yes, Delete',style: k18_500_FFFFFF,textAlign: TextAlign.center),
            height: 55,
            width: 160,
          ),
    )
  ],),
)
           ],
         //),
         ),
       );

   }
 }
 