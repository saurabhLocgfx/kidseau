import 'dart:convert';

import 'package:http/http.dart' as http;

class ParentSignUpInfo {
  Future<dynamic> get(
      {required String motherName,
      required String motherOccupation,
      required String motherContact,
      required String motherEmail,
      required String fatherName,
      required String fatherOccupation,
      required String fatherContact,
      required String fatherEmail,
      required String address,
      required String parents,
      required dynamic pickedImage}) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://cerebal.locgfx.com/kidsue/kids/api_parent_login/pt_sign_up.php'));
    request.fields.addAll({
      'mother_name': motherName,
      'mother_occupation': motherOccupation,
      'mother_contact': motherContact,
      'mother_email': motherEmail,
      'father_name': fatherName,
      'father_occupation': fatherOccupation,
      'father_contact': fatherContact,
      'father_email': fatherEmail,
      'address': address,
      'you_are': parents
    });
    print(pickedImage);
    request.files.add(
        await http.MultipartFile.fromPath('profile_photo', "$pickedImage"));
    print(request.files);
    http.StreamedResponse response = await request.send();
    var rsp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return rsp;
    } else {
      return rsp;
    }
  }
}
