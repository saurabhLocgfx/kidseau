import 'package:flutter/material.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homesubpages/learningalphabets.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

class School extends StatefulWidget {
  const School({Key? key}) : super(key: key);

  @override
  State<School> createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  var receptioninfo = ["Email id", "Phone number", "Address"];
  var receptioninfodata = [
    "Xyz@gmail.com",
    "9876543210",
    "6391 Elgin St. Celina,"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 128,
                      width: 96,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/profileperson.png"))),
                    ),
                    SizedBox(width: 25),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ABC Nursery School",
                            style: FontConstant.k24w500brownText,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/clockicon.png",
                                height: 24,
                              ),
                              SizedBox(width: 10),
                              Text("08:00 am to 02:00 pm",
                                  style: FontConstant.k16w5008471Text),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Reception Info",
                style: FontConstant2.k22w5008471text,
              ),
              SizedBox(height: 6),
              Container(
                height: 125,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: receptioninfo.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Container(
                            width: 104,
                            height: 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Text(
                                    receptioninfo[index],
                                    style: FontConstant.k16w500331FText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                receptioninfodata[index],
                                style: FontConstant.k16w5008471Text,
                              )
                            ],
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                        "assets/images/facebookicon.png",
                      )),
                  CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                        "assets/images/Twittericon.png",
                      )),
                  CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                        "assets/images/linkedicon.png",
                      )),
                  CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                        "assets/images/instagramicon.png",
                      )),
                ],
              ),
              SizedBox(height: 32),
              TeacherCard(),
              SizedBox(height: 68),
              SizedBox(
                height: 52,
                width: 382,
                child: MainButton(
                    onTap: () {},
                    title: "Locate us",
                    textStyleColor: Colors.white,
                    backgroundColor: ThemeColor.primarycolor),
              ),
              SizedBox(
                height: 125,
              )
            ],
          ),
        ),
      ),
    );
  }
}
