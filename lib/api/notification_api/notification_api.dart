import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class NotificationApi {
  Future<dynamic> get() async {
    String? cookie = UserPrefs.getCookies();
    String? fcmToken = UserPrefs.getFCM();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.Request(
        'POST', Uri.parse('$kAPIConst/kids/notification-token.php'));
    request.body = json.encode({
      "fcm_token": "$fcmToken",
      "device_type": Platform.isAndroid ? "android" : "ios"
    });
    request.headers.addAll(headers);
    log(request.body);

    http.StreamedResponse response = await request.send();

    // var v = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      // return v;
    } else {
      print(response.reasonPhrase);
      // return v;
    }
  }
}
