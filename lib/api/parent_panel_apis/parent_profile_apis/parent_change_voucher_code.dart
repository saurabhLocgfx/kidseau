import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class ParentChangeVoucherCode {
  Future<dynamic> get(
      {required String kidId, required String voucherCode}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '$kAPIConst/api_parent_profile/kid_voucher_change_code.php?kid_id=$kidId'));
    request.fields.addAll({'voucher_code': voucherCode});

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
