import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../shard_prefs/shared_prefs.dart';

Future<dynamic> googleSignInApi({
  required String id_token,


}) async{
   String? cookie = UserPrefs.getCookies();
  var headers = {'Cookie': 'PHPSESSID=$cookie'};



var request = http.MultipartRequest('POST', Uri.parse('https://application.kidseau.com/sign-up-with-google.php'));
request.fields.addAll({
'id_token': id_token,
'user_type': 'teacher'
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

Future<dynamic> googleSignInApiParent({
  required String id_token,
}) async{

  String? cookie = UserPrefs.getCookies();
  var headers = {'Cookie': 'PHPSESSID=$cookie'};


  var request = http.MultipartRequest('POST', Uri.parse('https://application.kidseau.com/sign-up-with-google.php'));
  request.fields.addAll({
    'id_token': id_token,

    'device': 'google',
    'user_type': 'parent'
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
    print(response.reasonPhrase);
  }

}