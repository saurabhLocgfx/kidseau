import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import '../../../Constants/string_const.dart';

class TeacherInfoFill {
  Future<dynamic> get(
      {required String fname,
      required String familyname,
      required String email,
      required String phone,
      required String dateofbirth,
      required String education,
      required String exp,
      required String gender,
      required String address,
      required List<String> language}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.MultipartRequest('POST',
        Uri.parse('$kAPIConst/api_teacher_login/teacher_info_fill.php'));

    /*final input = '$language';
    final removedBrackets = input.substring(1, input.length - 1);
    final parts = removedBrackets.split(', ');

    var joined = parts.map((part) => "'$part'").join(', ');
*/
    //print(joined);

    request.fields.addAll({
      'f_name': fname,
      'family_name': familyname,
      'email': email,
      'phone': phone,
      'dob': dateofbirth,
      'edu': education,
      'exp': exp,
      'gender': gender.toLowerCase() == 'male' ? 'M' : 'F',
      'address': address,
      'lang': '$language',
    });
    log(request.fields.toString());
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    //print(await response.stream.bytesToString());
    var resp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return resp;
    } else {
      return resp;
    }
  }
}
