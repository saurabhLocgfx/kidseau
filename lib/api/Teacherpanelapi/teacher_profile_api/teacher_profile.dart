import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TeacherProfileApi{
  Future<dynamic> get()async{
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.Request('GET', Uri.parse('$kAPIConst/kids/api_teacher_login/teacher_profile/profile_teacher.php'));

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