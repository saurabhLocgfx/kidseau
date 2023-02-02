import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class SendMessageApi {
  Future<dynamic> get(
      {required String message,
      required String sendToId,
      required String receiverUserType,
      required File image}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('$kAPIConst/kids/api_message/sendTextmsg.php'));
    request.fields.addAll({
      'message': message,
      'send_to_id': sendToId,
      'reciever_user_type': receiverUserType
    });
    request.files.add(await http.MultipartFile.fromPath('file', image.path));
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
