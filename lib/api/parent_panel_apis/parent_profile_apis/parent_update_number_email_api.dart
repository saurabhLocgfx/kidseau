import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class ParentUpdateNumberEmailApi {
  Future<dynamic> get(
      {required String email,
      required String phone,
      required bool isMother}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            '$kAPIConst/api_parent_profile/number_change_and_verified/enter_chnage_num_email.php'));
    request.body = json.encode({
      if (!isMother && phone.isNotEmpty) "f_con": phone,
      if (!isMother && email.isNotEmpty) "f_email": email,
      if (isMother && phone.isNotEmpty) "m_con": phone,
      if (isMother && email.isNotEmpty) "m_email": email,
      "belongs": !isMother ? "Father" : "Mother"
    });
    log(request.body);
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
