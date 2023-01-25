import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';

class ParentSignUp {
  Future<dynamic> get({required String email, required String parents}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('$kAPIConst/kids/api_parent_login/pt_ft_sign_up.php'));
    request.body = json.encode(
        {"email_phone": email, if (parents == "Mother") "you_are": parents});
    log(request.body.toString());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var res = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return res;
    } else {
      return res;
    }
  }
}
