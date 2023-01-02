import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/api/models/group_resp.dart';
import 'package:kidseau/api/models/section_resp.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class GetSections {
  Future<dynamic> get() async {
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie',
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://cerebal.locgfx.com/kidsue/kids/api_parent_login/kid_sch_all_section_fetch.php'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    //http.StreamedResponse response = await request.send();
    var rsp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      SectionResponse response = SectionResponse.fromJson(rsp);
      return response;
    } else {
      return rsp;
    }
  }

  Future<dynamic> getGroups({required String sectionId}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie',
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://cerebal.locgfx.com/kidsue/kids/api_parent_login/kid_section_and_group.php?sec_id=$sectionId'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    //http.StreamedResponse response = await request.send();
    var rsp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      GroupResponse response = GroupResponse.fromJson(rsp);
      return response;
    } else {
      return rsp;
    }
  }
}
