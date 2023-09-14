import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class NotificationCheckApi {
  Future<dynamic> get() async {
    String? cookie = UserPrefs.getCookies();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.Request(
        'GET', Uri.parse('$kAPIConst/notification/get-notification-red.php'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = jsonDecode(await response.stream.bytesToString());
      return resp;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
