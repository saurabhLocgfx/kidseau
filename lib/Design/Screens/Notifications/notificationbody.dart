import 'package:flutter/material.dart';
import 'package:kidseau/Design/Screens/Notifications/notifications.dart';
import 'package:kidseau/Theme.dart';

class list2 extends StatelessWidget {
  const list2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: images2.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Container(
              height: 99,
              width: 414,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    Container(
                      height: 67,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(08),
                          image: DecorationImage(
                              image: AssetImage(images2[index]))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mohammad Umar has added new post",
                            style: FontConstant.k16w500331FText,
                          ),
                          Row(
                            children: [
                              Text(
                                "Announcement",
                                style: FontConstant.k14w5008471Text,
                              ),
                              SizedBox(width: 08),
                              Center(
                                child: Icon(
                                  Icons.circle,
                                  size: 3,
                                  color: Color(0xffB7A4B2),
                                ),
                              ),
                              SizedBox(width: 06),
                              Text(
                                "2 hours ago.",
                                style: FontConstant.k14w5008471Text,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class list1 extends StatelessWidget {
  const list1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: 99,
              width: 414,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    Container(
                      height: 67,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(08),
                          image: DecorationImage(
                              image: AssetImage(images[index]))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mohammad Umar has added new post",
                            style: FontConstant.k16w500331FText,
                          ),
                          Row(
                            children: [
                              Text(
                                "Announcement",
                                style: FontConstant.k14w5008471Text,
                              ),
                              Text(
                                "2 hours ago.",
                                style: FontConstant.k14w5008471Text,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
