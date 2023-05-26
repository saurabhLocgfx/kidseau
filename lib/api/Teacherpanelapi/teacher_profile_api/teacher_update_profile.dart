import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TeacherUpdateProfile {
  Future<dynamic> update(
      {required String dob,
      required String education,
      required String experience,
      required String gender,
      required String address}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '$kAPIConst/api_teacher_login/teacher_profile/teach_update_profile.php'));
    request.fields.addAll({
      'dob': dob,
      'edu': education,
      'exp': experience,
      'gender': gender,
      'address': address
    });

    log(request.fields.toString());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var v = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return v;
    } else {
      print(response.reasonPhrase);
      return v;
    }
  }
}
