import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class UpdateFieldOTP {
  Future<dynamic> get({required String otp}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '$kAPIConst/kids/api_parent_profile/number_change_and_verified/check_change_num_email.php'));
    request.body = json.encode({"enter_otp": otp});
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
