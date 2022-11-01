import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homesubpages/Kidsection/medicalinformation.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class KidsInformation extends StatefulWidget {
  const KidsInformation({Key? key}) : super(key: key);

  @override
  State<KidsInformation> createState() => _KidsInformationState();
}

class _KidsInformationState extends State<KidsInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff8267AC).withOpacity(0.16),
        ),
        backgroundColor: Color(0xff8267AC).withOpacity(0.16),
        title: Text(
          "Back",
          style: FontConstant.k18w5008471Text,
        ),
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/images/backarrow.png",
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Kid’s Information",
                  style: FontConstant2.k24w500331Ftext,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kid’s name",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  textfield(context, "Enter your Kid’s name")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Class Section",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  textfield(context, "Select class section")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Age",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  textfield(context, "Enter your Kid’s age")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Birthday",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  IconTextfield(
                      Icon: "assets/images/calendericon.png",
                      title: "dd/mm/yyyy")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gender",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  IconTextfield(
                      Icon: "assets/images/arrowdown.png",
                      title: "Select gender"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Upload kid’s photo",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  IconTextfield(
                      Icon: "assets/images/uploadicon.png",
                      title: "Upload kid’s photo")
                ],
              ),
              SizedBox(height: 32),
              SizedBox(
                height: 52,
                width: 382,
                child: MainButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicalInformation()),
                      );
                    },
                    title: "Continue",
                    textStyleColor: Colors.white,
                    backgroundColor: ThemeColor.primarycolor),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
