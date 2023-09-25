import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../shard_prefs/shared_prefs.dart';

Future<dynamic> appleSignInApi({
  required String id_token,
  required String auth_code,
  required String ParentTeacher,
}) async {

  String? cookie = UserPrefs.getCookies();
  var headers = {'Cookie': 'PHPSESSID=$cookie'};


  var request = http.MultipartRequest('POST', Uri.parse('https://application.kidseau.com/sign-up-with-google.php'));
  request.fields.addAll({
    'id_token': id_token,
    'device': 'apple',
    'user_type': ParentTeacher,
    'authorization_code': auth_code,
    'grant_type': 'authorization_code'
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();


  var resBody = jsonDecode(await response.stream.bytesToString());

  if (response.statusCode == 200) {
    print(resBody);
    return resBody;
  }
  else {
    print(response.reasonPhrase);
    print(response.statusCode);
    print(resBody);
    return resBody;

  }

}