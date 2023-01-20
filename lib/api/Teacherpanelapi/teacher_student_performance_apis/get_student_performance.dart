import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class GetStudentPerformance {
  Future<dynamic> get({required String grpId, required String actId}) async {
    log(grpId);
    log(actId);
    String? cookie = UserPrefs.getCookies();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '$kAPIConst/kids/api_teacher_login/student_prefomance/actGroupStudent.php?grp_id=$grpId&act_id=$actId'));
    request.body = '''''';
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
