import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TeacherVerifyUpdateOTP{
  Future<dynamic> get({required String otp})async{
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.MultipartRequest('POST', Uri.parse('$kAPIConst/kids/api_teacher_login/teacher_profile/check_otp_update_numer.php'));
    request.fields.addAll({
      'enter_otp': otp
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var v = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return v;
    }
    else {
      print(response.reasonPhrase);
      return v;
    }
  }
}