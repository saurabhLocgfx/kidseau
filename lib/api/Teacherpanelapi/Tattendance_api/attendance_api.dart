import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TeacherSubmitAttendanceAPI{
  Future<dynamic> submit(List<Map<String,dynamic>> attendanceList)async{
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.Request('POST', Uri.parse('$kAPIConst/kids/api_teacher_login/teacher_home_page/attendance_action_p_a.php'));
    request.body = json.encode(attendanceList
        /*[
      {
        "kid_id": 1,
        "status": 1
      },
      {
        "kid_id": 5,
        "status": 0
      }
    ]*/);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var v =jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return v;
    }
    else {
      print(response.reasonPhrase);
      return v;
    }
  }
}