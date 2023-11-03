import 'dart:convert';

import 'package:http/http.dart' as http;

import '../shard_prefs/shared_prefs.dart';

Future<dynamic> facebookSignInApi({
  required String idToken,
  required String parentTeacher,
  required String device,
}) async {
  String? cookie = UserPrefs.getCookies();
  var headers = {'Cookie': 'PHPSESSID=$cookie'};
  var request = http.MultipartRequest('POST',
      Uri.parse('https://application.kidseau.com/sign-up-with-google.php'));
  request.fields.addAll(
      {'id_token': idToken, 'device': device, 'user_type': parentTeacher});
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var resBody = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(resBody);
    return resBody;
  } else {
    print(response.reasonPhrase);
    print(resBody);
    print(response.statusCode);
  }
}
