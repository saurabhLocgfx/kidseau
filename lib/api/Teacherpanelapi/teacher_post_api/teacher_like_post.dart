import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TeacherLikePost{
  Future<dynamic> get({required int postId})async{
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.MultipartRequest('POST', Uri.parse('$kAPIConst/kids/api_teacher_login/teacher_post/teacher_like_post.php'));
    request.fields.addAll({
      'post_id': '$postId'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var v = jsonDecode(await response.stream.bytesToString());
    log(v.toString());
    if (response.statusCode == 200) {
      return v;
    }
    else {
      print(response.reasonPhrase);
      return v;
    }
  }
}