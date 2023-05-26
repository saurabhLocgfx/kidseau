import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

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
      // required String parents,
      required File pickedImage}) async {
    String? cookie = UserPrefs.getCookies();
    log('cookie $cookie');
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie',
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('$kAPIConst/api_parent_login/pt_sign_up.php'));
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
      //'profile_photo': "$pickedImage"
    });
    if (pickedImage.path.isNotEmpty) {
      request.files.add(
          await http.MultipartFile.fromPath('profile_photo', pickedImage.path));
    }

    request.headers.addAll(headers);
    log(request.fields.toString());
    //log(request.files[0].toString());
    http.StreamedResponse response = await request.send();
    //http.StreamedResponse response = await request.send();
    var rsp = jsonDecode(await response.stream.bytesToString());
    log('api $rsp');
    if (response.statusCode == 200) {
      return rsp;
    } else {
      return rsp;
    }

    /*var request = http.MultipartRequest(
        'POST', Uri.parse('$kAPIConst/api_parent_login/pt_sign_up.php'));
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
      // 'you_are': parents
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
    }*/
  }
}
