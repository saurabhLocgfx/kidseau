import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class THomeApi {
  Future<dynamic> get() async {
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
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '$kAPIConst/api_teacher_login/teacher_home_page/teacher_home screen.php?grp_id=1&lang=$langId'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var v = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      //log('response $v');
      return v;
    } else {
      print(response.reasonPhrase);
      return v;
    }
  }
}
