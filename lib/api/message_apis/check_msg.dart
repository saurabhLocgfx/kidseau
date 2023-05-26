import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import '../../Constants/string_const.dart';

class CheckMessage {
  Future<dynamic> get() async {
    String? cookie = UserPrefs.getCookies();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request =
        http.Request('GET', Uri.parse('$kAPIConst/api_message/msg-check.php'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var resp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return resp;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
