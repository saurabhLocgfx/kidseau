import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';

class ParentLogin {
  Future<dynamic> get({required String email}) async {
    /* String? cookie = UserPrefs.getCookies();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie'
    };*/
    var request = http.Request(
        'POST', Uri.parse('$kAPIConst/api_parent_login/pt_login.php'));
    request.body = json.encode({"email_phone": email});
    // request.headers.addAll(headers);
    // print(request.body);
    http.StreamedResponse response = await request.send();
    // print(await response.stream.bytesToString());
    var v = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      //final model = THomeModel.fromJson(json);
      return v;
    } else {
      print(response.reasonPhrase);
      return v;
    }
  }
}
