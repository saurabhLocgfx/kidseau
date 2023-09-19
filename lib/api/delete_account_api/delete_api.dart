import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../shard_prefs/shared_prefs.dart';

Future<dynamic> deleteApi() async {
  String? cookie = UserPrefs.getCookies();
  var headers = {'Cookie': 'PHPSESSID=$cookie'};
  /*var headers = {
    'Cookie': 'PHPSESSID=30ndk9scraina3k8052hstggl6'
  };*/
  var request = http.Request('POST', Uri.parse('https://application.kidseau.com/acdelete.php'));

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