import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class UserLogin {
  Future<dynamic> get() async {
    String? cookie = UserPrefs.getCookies();
    String? otp = UserPrefs.getOTP();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('$kAPIConst/password_check.php'));
    request.fields.addAll({'enter_password': "$otp"});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var resp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return resp;
    } else {
      print(response.reasonPhrase);
      return resp;
    }
  }
}
