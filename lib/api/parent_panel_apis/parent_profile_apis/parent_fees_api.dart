import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class ParentFeesApi {
  Future<dynamic> get({required String kidId}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '$kAPIConst/api_parent_profile/kid_fees_show.php?kid_id=$kidId'));

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
