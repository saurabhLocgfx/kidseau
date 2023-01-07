import 'dart:developer';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

import 'TAddAnnouncement.dart';
import 'TPostFormScreen.dart';

class TAddPostsScreen extends StatefulWidget {
  const TAddPostsScreen({Key? key}) : super(key: key);

  @override
  State<TAddPostsScreen> createState() => _TAddPostsScreenState();
}

class _TAddPostsScreenState extends State<TAddPostsScreen> {
  final _picker = ImagePicker();
  final CarouselController _controller = CarouselController();
  List<File> _pickedImages = [];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _pickedImages.isEmpty?Column(
        children: [
          SizedBox(height: 70),
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(16),
            strokeWidth: 2,
            color: Color(0xffB7A4B2),
            dashPattern: [10, 10],
            child: InkWell(
              onTap: ()async{
                List<XFile> images = await _picker.pickMultiImage();
                setState(() {
                  for(var v in images){
                    _pickedImages.add(File(v.path));
                  }
                });
                if(_pickedImages.isNotEmpty){
                  log(_pickedImages.toString());
                }
              },
              child: Container(
                color: Colors.transparent,
                width: 200.w,
                height: 250.h,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/add.png',
                        width: 100,
                      ),
                      SizedBox(height: 24),
                      Text("Add Photos".tr(),
                          style: FontConstant.k18w500B7A4Text),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text("OR".tr(), style: FontConstant.k18w500B7A4Text),
          SizedBox(height: 20),
          SizedBox(
            width: 382.w,
            height: 52.h,
            child: materialButton(
              context,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddAnnouncement(),
                  ),
                );
              },
              "Add Announcement".tr(),
              Color(0xFFF0AD56),
              52.0,
            ),
          )
        ],
      ): Column(
        children: [
          SizedBox(height: 20,),
          CarouselSlider.builder(
            carouselController: _controller,
            itemCount: _pickedImages.length,
            itemBuilder: (ctx, index, realIndex) {
             return Container(
               //color: Colors.red,
               height: 350,
               child: Stack(
                // clipBehavior: Clip.antiAlias,
                 children: [
                   ClipRRect(
               borderRadius: BorderRadius.circular(40),
                     child: Image.file(
                       _pickedImages[index],
                       fit: BoxFit.fitWidth,
                     ),
                   ),
                   Positioned(
                     top: 0,
                     right: 0,
                     child: InkWell(
                       onTap: (){
                         setState(() {
                           _pickedImages.removeAt(index);
                         });
                       },
                       child: Container(
                         padding: EdgeInsets.all(10),
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: Colors.red
                         ),
                         child: Icon(Icons.delete_rounded, color: Colors.white,),
                       ),
                     ),
                   )
                 ],
               ),
             );
            },
            options: CarouselOptions(
              //height: 40.h,
              onPageChanged: (index, reason) {
                setState(() {
                  _index = index;
                });
              },
              viewportFraction: 0.5,
              enlargeFactor: 0.3,
              aspectRatio: 16/9,
              enlargeCenterPage: true,
              //pageSnapping: false,
              enableInfiniteScroll: false,
            ),
          ),
          SizedBox(height: 36,),
          InkWell(
            onTap: ()async{
              List<XFile> images = await _picker.pickMultiImage();
              setState(() {
                for(var v in images){
                  _pickedImages.add(File(v.path));
                }
              });
              if(_pickedImages.isNotEmpty){
                log(_pickedImages.toString());
              }
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/addmore.png', width: 24,height: 24,),
                  SizedBox(width: 16,),
                  Text('Add more'.tr(),style: FontConstant2.baloo500_18_8267AC,)
                ],
              ),
            ),
          ),
          SizedBox(height: 38,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 54,
            child: Row(
              children: [
                Expanded(
                  child: MainButton(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> TPostFormScreen(pickedImages: _pickedImages,)));
                    },
                    title: "Continue".tr(),
                    textStyleColor: Colors.white,
                    backgroundColor: ThemeColor.primarycolor),
                )
              ],
            ),
          ),
          SizedBox(height: 16,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 54,
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    onPressed: () {
                      setState(() {
                        _pickedImages.clear();
                      });
                    },
                    child: Center(
                      child: Text(
                        'Discard'.tr(),
                        style: FontConstant.k18w500SecondaryMaterialButtonText,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
