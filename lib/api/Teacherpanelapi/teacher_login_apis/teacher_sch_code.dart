import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TeacherSchCode {
  Future<dynamic> get({required String code}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://cerebal.locgfx.com/kidsue/kids/api_teacher_login/teacher_sch_code.php'));
    request.body = json.encode({"sch_code": code});
    request.headers.addAll(headers);
    print(request.body);
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
