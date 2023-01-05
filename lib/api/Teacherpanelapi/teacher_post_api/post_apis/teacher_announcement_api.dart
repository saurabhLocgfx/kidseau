import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TeacherAnnouncementApi{
  Future<dynamic> post({required String title, required String desc,required String time, required String date})async{
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.MultipartRequest('POST', Uri.parse('$kAPIConst/kids/api_teacher_login/teacher_post/annoucement_teacher.php'));
    request.fields.addAll({
      'title': title,
      'description': desc,
      if(time != '')'time': time,
      if(date != '')'date': date
    });

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