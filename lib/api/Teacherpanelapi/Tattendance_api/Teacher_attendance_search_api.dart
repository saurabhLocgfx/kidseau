import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TeacherAttendanceSearchAPI{
  Future<dynamic> get({required String groupId, required String searchedName})async{
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.MultipartRequest('GET', Uri.parse('$kAPIConst/kids/api_teacher_login/teacher_home_page/attendance_grp_kid_serch.php?attend_group_id=$groupId&kid_name=$searchedName'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var v = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return v;
    }
    else {
      print(response.reasonPhrase);
      return v;
    }

  }
}