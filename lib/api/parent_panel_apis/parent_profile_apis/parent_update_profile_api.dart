import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class ParentUpdateApi {
  Future<dynamic> get(
      {required String mName,
      required String mOccupation,
      required String fName,
      required String fOccupation,
      required String address}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.Request('POST',
        Uri.parse('$kAPIConst/kids/api_parent_profile/kid_parent_update.php'));
    request.body = json.encode({
      "m_name": mName,
      "m_occup": mOccupation,
      "f_name": fName,
      "f_occup": fOccupation,
      "address": address
    });
    request.headers.addAll(headers);

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
