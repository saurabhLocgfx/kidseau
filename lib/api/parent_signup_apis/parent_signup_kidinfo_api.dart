import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class KidsSignupInfo {
  Future<dynamic> get(
      {required String kidName,
      required String kidSection,
      required String kidGroup,
      required String kidAge,
      required String kidBirthday,
      required String kidGender,
      required dynamic pickedImage}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie',
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('$kAPIConst/kids/api_parent_login/pt_sign_up.php'));
    request.fields.addAll({
      'kid_name': kidName,
      'sec_grp': kidSection,
      'age': kidGroup,
      'birth_date': kidAge,
      'gender': kidGender,
      'profile_pic': "$pickedImage"
    });
    request.files
        .add(await http.MultipartFile.fromPath('profile_pic', "$pickedImage"));
    request.headers.addAll(headers);
    print(request.fields);
    http.StreamedResponse response = await request.send();
    //http.StreamedResponse response = await request.send();
    var rsp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return rsp;
    } else {
      return rsp;
    }
  }
}
