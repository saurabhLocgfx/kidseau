import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TeacherEditPostApi {
  Future<dynamic> get(
      {required String postId,
      required String caption,
      required List<String> tagId}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.MultipartRequest('POST',
        Uri.parse('$kAPIConst/api_teacher_login/teacher_post/post_edit.php'));
    request.fields.addAll({
      'post_id': postId,
      'captions': caption,
      'tag_kid': '$tagId',
    });

    request.headers.addAll(headers);

    log(request.fields.toString());
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
