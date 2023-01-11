import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TeacherUpdateProfilePicture{
  Future<dynamic> get({required File pickedImage})async{
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.MultipartRequest('POST', Uri.parse('$kAPIConst/kids/api_teacher_login/teacher_profile/t_img_insert_update.php'));
    request.files.add(await http.MultipartFile.fromPath('tech_profile', pickedImage.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var v = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return v;
    }
    else {
      print(response.reasonPhrase);
      return v;
    }
  }
}