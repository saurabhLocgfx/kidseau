import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class ParentKidApi {
  Future<dynamic> get() async {
    String? cookie = UserPrefs.getCookies();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.Request('GET',
        Uri.parse('$kAPIConst/kids/parent_home_page/parent_all_kid_id.php'));

    request.headers.addAll(headers);

    log(request.headers.toString());
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
