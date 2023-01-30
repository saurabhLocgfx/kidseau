import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class UpdateParentProfilePic {
  Future<dynamic> get({required File pickedImg}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '$kAPIConst/kids/api_parent_profile/parent_image_upadte.php'));
    request.files.add(
        await http.MultipartFile.fromPath('update_image_pt', pickedImg.path));
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
