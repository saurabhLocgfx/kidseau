import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import '../../../Constants/string_const.dart';
import '../../models/Tschool_post_model/teacher_school_post_model.dart';

class TeacherAllPostApi{
  Future<SchoolPostModel> get({required int scroll})async{
    //print(scroll);
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.Request('GET', Uri.parse('$kAPIConst/kids/api_teacher_login/teacher_post/tech_sch_post_show.php?scrol=$scroll'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var v = jsonDecode(await response.stream.bytesToString());
      //log(v.toString());
      SchoolPostModel model = SchoolPostModel.fromJson(v);
      return model;
    }
    else {
      print(response.reasonPhrase);
      throw Exception();
    }
  }
}