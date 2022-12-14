import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TeacherInfoFill {
  Future<dynamic> get(
      {required String fname,
      required String familyname,
      required String email,
      required String phone,
      required String dateofbirth,
      required String education,
      required String exp,
      required String gender,
      required String address,
      required List<String> language}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://cerebal.locgfx.com/kidsue/kids/api_teacher_login/teacher_info_fill.php'));
    request.fields.addAll({
      'f_name': fname,
      'family_name': familyname,
      'email': email,
      'phone': phone,
      'dob': dateofbirth,
      'edu': education,
      'exp': exp,
      'gender': gender == 'male'
          ? 'M'
          : gender == 'female'
              ? 'F'
              : 'O',
      'address': address,
      'lang': '$language',
    });
    print(request.fields);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    //print(await response.stream.bytesToString());
    var resp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return resp;
    } else {
      return resp;
    }
  }
}
