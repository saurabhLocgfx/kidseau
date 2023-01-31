import 'dart:convert';
import 'dart:developer';
import 'dart:io';

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
      required File pickedImage}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie',
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('$kAPIConst/kids/api_parent_login/pt_kidinfo_sign_up.php'));
    request.fields.addAll({
      'kid_name': kidName,
      'sec_grp': kidGroup,
      'age': kidAge,
      'birth_date': kidBirthday,
      'gender': kidGender == 'Male'
          ? 'M'
          : kidGender == 'Female'
              ? 'F'
              : 'O',
      //'profile_pic': "$pickedImage"
    });
    log(request.fields.toString());
    request.files.add(
        await http.MultipartFile.fromPath('profile_pic', pickedImage.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    //print(await response.stream.bytesToString());
    var rsp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return rsp;
    } else {
      return rsp;
    }
  }
}
