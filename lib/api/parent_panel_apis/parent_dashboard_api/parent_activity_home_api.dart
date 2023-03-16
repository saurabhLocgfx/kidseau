import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class ParentActivityHomeApi {
  Future<dynamic> get({required String kidId}) async {
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
            '$kAPIConst/kids/parent_home_page/parent_home.php?grp_id=$kidId&lang=$langId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.request);
    var v = jsonDecode(await response.stream.bytesToString());
    //print(v);
    if (response.statusCode == 200) {
      return v;
    } else {
      print(response.reasonPhrase);
      return v;
    }
  }
}
