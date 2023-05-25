import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';

import '../../shard_prefs/shared_prefs.dart';

class ParentLoginOtp {
  Future<dynamic> get({required String code}) async {
    String? cookie = UserPrefs.getCookies();
    log("cookie $cookie");
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.Request(
        'POST', Uri.parse('$kAPIConst/kids/api_parent_login/login_otp.php'));
    request.body = json.encode({"enter_otp": code});
    request.headers.addAll(headers);
    print(request.body);
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
