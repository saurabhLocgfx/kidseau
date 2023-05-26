import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';

import '../../shard_prefs/shared_prefs.dart';

class VoucherCode {
  Future<dynamic> get({required String Vouchercode}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.Request(
        'POST', Uri.parse('$kAPIConst/api_parent_login/voucher_verified.php'));
    request.body = json.encode({"voucher": Vouchercode});
    print(request.body);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    //  print(await response.stream.bytesToString());
    var rep = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return rep;
    } else {
      return rep;
    }
  }
}
