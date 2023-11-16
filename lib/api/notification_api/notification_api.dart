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
    var request =
        http.Request('POST', Uri.parse('$kAPIConst/notification-token.php'));
    request.body = json.encode({
      "fcm_token": "$fcmToken",
      "device_type": Platform.isAndroid ? "android" : "ios"
    });
    request.headers.addAll(headers);
    log(request.body);

    http.StreamedResponse response = await request.send();

    var v = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      print('check notification ${v}');
      return v;
    } else {
      print(response.reasonPhrase);
      return v;
    }
  }

  Future<dynamic> setNotificationSettings({
    required String post,
    required String announcement,
    required String message,
  }) async {
    String? cookie = UserPrefs.getCookies();
    String? fcmToken = UserPrefs.getFCM();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('$kAPIConst/notification/notification_setting.php'));
    request.fields.addAll({
      'post_n': post,
      'annous_n': announcement,
      'message_n': message,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var v = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return v;
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<dynamic> getNotifications(int page) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.Request('GET',
        Uri.parse('$kAPIConst/notification/get_notification.php?scrol=$page'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var v = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return v;
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<dynamic> readNotification(List ids) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.Request('GET',
        Uri.parse('$kAPIConst/notification/read_notification.php?n_id=$ids'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var v = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return v;
    } else {
      print(response.reasonPhrase);
    }
  }
}
