import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TeacherGroupStudentsAPi {
  Future<dynamic> get({required String grpId, required String page}) async {
    print(grpId);
    String? cookie = UserPrefs.getCookies();
    String? selectedLang = UserPrefs.getLang();
    String langId = '';
    if (selectedLang.toString() == 'English') {
      langId = '0';
    } else if (selectedLang.toString() == 'French') {
      langId = '2';
    } else {
      langId = '1';
    }
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '$kAPIConst/api_teacher_login/teacher_home_page/teach_class_all_kid.php?grp_id=$grpId&page_no=$page&lang=$langId'));

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
