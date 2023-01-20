import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class SubmitPerformanceApi {
  Future<dynamic> get(
      {String? date, required List<Map<String, dynamic>> performance}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            '$kAPIConst/kids/api_teacher_login/student_prefomance/actvity_action.php'));
    request.body = json.encode({
      if (date != null) "date": date,
      "arr": performance
      /*[
        {"kid_id": 1, "pfm": 3, "days_activity_id": 5},
        {"kid_id": 27, "pfm": 4, "days_activity_id": 5},
        {"kid_id": 28, "pfm": 4, "days_activity_id": 5}
      ]*/
    });
    request.headers.addAll(headers);
    log(request.body.toString());

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
