import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TeacherPostAPI {
  Future<dynamic> get(
      {required List<String> idList,
      required String caption,
      required String secId,
      required String grpId,
      required List<File> imgList}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '$kAPIConst/api_teacher_login/teacher_post/post_send_cap_img.php'));
    //log(idList.length.toString());
    request.fields.addAll({
      'captions': caption,
      'sec_id': secId,
      'grp_id': grpId,
      'tag_kid': '$idList',
    });
    for (var v in imgList) {
      request.files
          .add(await http.MultipartFile.fromPath('file_name[]', v.path));
    }
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
