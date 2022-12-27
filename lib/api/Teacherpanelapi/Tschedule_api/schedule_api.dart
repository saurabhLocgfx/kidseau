import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/api/Teacherpanelapi/Tmodel/TScheduleModel.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TScheduleApi {
  Future<TScheduleModel> get() async {
    String? cookie = UserPrefs.getCookies();

    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '$kAPIConst/kids/api_teacher_login/teacher_home_page/teach_class_schedule.php'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var v = jsonDecode(await response.stream.bytesToString());
      final model = TScheduleModel.fromJson(v);
      return model;
    } else {
      print(response.reasonPhrase);
      throw Exception();
    }
  }
}
