import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TeacherUpdateEmailNumberApi {
  Future<dynamic> get({required String field}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '$kAPIConst/api_teacher_login/teacher_profile/update_phone_email.php'));
    if (field.contains('@')) {
      request.fields.addAll({'email': field});
    } else {
      request.fields.addAll({'phone': field});
    }

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
