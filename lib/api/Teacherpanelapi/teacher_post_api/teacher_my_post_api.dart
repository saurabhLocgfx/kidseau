import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/api/models/Tschool_post_model/teacher_school_my_post_model.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TeacherMyPostApi {
  Future<SchoolMyPostModel> get({required int scroll}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '$kAPIConst/api_teacher_login/teacher_post/tech_my_post.php?scrol=$scroll'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var v = jsonDecode(await response.stream.bytesToString());
      // log(v.toString());
      SchoolMyPostModel model = SchoolMyPostModel.fromJson(v);
      return model;
    } else {
      print(response.reasonPhrase);
      throw Exception();
    }
  }
}
