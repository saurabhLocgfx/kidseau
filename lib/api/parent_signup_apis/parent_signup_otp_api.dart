import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';

import '../../shard_prefs/shared_prefs.dart';

class ParentSignUpOtp {
  Future<dynamic> get({required int code}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.Request(
        'POST', Uri.parse('$kAPIConst/api_parent_login/check_pt_otp.php'));
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
