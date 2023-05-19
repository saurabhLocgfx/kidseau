import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PLearningAlphabets.dart';
import 'package:kidseau/Theme.dart';
import 'package:video_player/video_player.dart';

import '../../api/models/parent_models/parent_home_models/parent_activity_home_model.dart';

class Activity extends StatefulWidget {
  ParentActivityHomeModel model;
  final int length;

  Activity({Key? key, required this.model, required this.length})
      : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  var title = [
    "learning Alphabets",
    "play game",
    "Sound recognization",
    "Rest"
  ];

  var groups = [
    "A",
    "B",
    "C",
    "D",
  ];

  var time = [
    "From 08:00 - 09:00 am",
    "From 09:15 - 10:00 am",
    "From 09:15 - 10:00 am",
    "From 09:15 - 10:00 am",
  ];

  // List<String> images =["assets/images/book 1.png","assets/images/block 1.png","assets/images/music-player 1.png","assets/images/sleeping 1.png"];
  var images = [
    "assets/images/block 1.png",
    "assets/images/music-player 1.png",
    "assets/images/sleeping 1.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: 1.sw,
      child: ListView.separated(
          separatorBuilder: (ctx, ind) => SizedBox(
                height: 14.h,
              ),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Get.to(() => PLearningAplphabets(
                      selectedDay: "",
                      actId:
                          widget.model.kidAndActivity![index].actId.toString(),
                    ));
              },
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          widget.model.kidAndActivity![index].actIcon
                              .toString(),
                          fit: BoxFit.cover,
                          errorBuilder: (q, w, e) {
                            return Image.asset(
                              "assets/images/book 1.png",
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            );
                          },
                          height: 40,
                          width: 40,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.model.kidAndActivity![index].actTitle
                                  .toString(),
                              style: FontConstant.k32w500blackText
                                  .copyWith(fontSize: 16),
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.model.kidAndActivity![index].timing
                                      .toString(),
                                  style: FontConstant.k14w400lightpurpleText
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xffB7A4B2)),
                                ),
                                /*SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  " ${widget.model.kidAndActivity![index].timing!.split('-').first} ",
                                  style: FontConstant.k14w400lightpurpleText
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xffB7A4B2)),
                                ),
                                Text(
                                  " ${widget.model.kidAndActivity![index].timing!.split('-').last}",
                                  style: FontConstant.k14w400lightpurpleText
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xffB7A4B2)),
                                ),*/
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class Tutorials extends StatefulWidget {
  final ParentActivityHomeModel model;
  Tutorials({Key? key, required this.model}) : super(key: key);

  @override
  State<Tutorials> createState() => _TutorialsState();
}

class _TutorialsState extends State<Tutorials> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: const EdgeInsets.only(right: 5.0, left: 5),
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return VideoWidget(model: widget.model, index: index);
          },
          separatorBuilder: (ctx, ind) => SizedBox(
                width: 8,
              ),
          itemCount: widget.model.videoTutorial!.length),
    );
  }
}

class VideoWidget extends StatefulWidget {
  final ParentActivityHomeModel model;
  final int index;
  const VideoWidget({Key? key, required this.model, required this.index})
      : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController controller;
  @override
  void initState() {
    controller = VideoPlayerController.network(
        widget.model.videoTutorial![widget.index].video.toString())
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        if (mounted) {
          setState(() {});
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (ctx) {
              return VideoDialog(model: widget.model, index: widget.index);
            });
      },
      child: Container(
        //color: Colors.black,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 148,
                width: 349,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.model.videoTutorial![widget.index].vPoster
                              .toString(),
                        ),
                        fit: BoxFit.fitWidth)),
                child: Center(
                  child: Image.asset(
                    "assets/images/play.png",
                    width: 40,
                    height: 40,
                  ),
                )
                /*Image.network(
                widget.model.videoTutorial![widget.index].vPoster.toString(),
                fit: BoxFit.fitWidth,
                errorBuilder: (q, w, e) => Text("Image not loaded"),
              ),*/
                ),
            Text(
              widget.model.videoTutorial![widget.index].vTitle.toString(),
              style: FontConstant.k16w500brownText,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/clock.png",
                      height: 13,
                      width: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 06.0),
                      child: Text(
                        controller.value.duration.inMinutes == 0
                            ? "${controller.value.duration.inSeconds} sec"
                            : "${controller.value.duration.inMinutes} min",
                        style: FontConstant.k14w400lightpurpleText,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    DateFormat.yMMMEd().format(DateTime.parse(widget
                        .model.videoTutorial![widget.index].vDate
                        .toString())),
                    style: FontConstant.k14w400lightpurpleText,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class VideoDialog extends StatefulWidget {
  final ParentActivityHomeModel model;
  final int index;
  const VideoDialog({Key? key, required this.model, required this.index})
      : super(key: key);

  @override
  State<VideoDialog> createState() => _VideoDialogState();
}

class _VideoDialogState extends State<VideoDialog>
    with TickerProviderStateMixin {
  late VideoPlayerController controller;

  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
        widget.model.videoTutorial![widget.index].video.toString())
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    //controller.value.duration;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(
      begin: 1,
      end: 2,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _animation2 = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      content: GestureDetector(
        onTap: () {
          setState(() {
            playing = !playing;
            if (playing) {
              controller.play();
              _animationController.forward();
            } else {
              _animationController.reverse();
              controller.pause();
            }
          });
        },
        child: Container(
          width: 1.sw,
          height: 250,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  // Use the VideoPlayer widget to display the video.
                  child: VideoPlayer(controller),
                ),
              ),
              //VideoPlayer(controller),
              Center(
                child: FadeTransition(
                  opacity: _animation2,
                  child: ScaleTransition(
                    scale: _animation,
                    child: Container(
                      color: Colors.black54,
                      width: 100,
                      height: 100,
                      child: Icon(
                        playing ? Icons.pause_circle : Icons.play_circle,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
