import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class ParentMedicalInfo {
  Future<dynamic> get(
      {required String bloodGrp,
      required String weight,
      required String height,
      required String medicalStatus,
      required String exCare,
      required bool father,
      required bool mother,
      required bool kid,
      required bool birth,
      required bool twoMonth,
      required bool fourMonth,
      required bool elevenMonth,
      required bool twelveMonth,
      required bool eighteenMonth,
      required bool sixYears}) async {
    String? cookie = UserPrefs.getCookies();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.MultipartRequest('POST',
        Uri.parse('$kAPIConst/kids/api_parent_login/pt_kd_medinfo.php'));
    request.fields.addAll({
      'bld_grp': bloodGrp,
      'weight': weight,
      'height': height,
      'medical_status': medicalStatus,
      'ex_care': exCare,
      if (father) 'covid_vaccination[]': 'father',
      if (mother) 'covid_vaccination[]': 'mother',
      if (kid) 'covid_vaccination[]': 'kid',
      if (birth) 'other_vacc[]': 'BCG/AVB@Birth',
      if (twoMonth) 'other_vacc[]': 'VPI-HVB@2 Months',
      if (fourMonth) 'other_vacc[]': 'VPI-AVB@4 Months',
      if (elevenMonth) 'other_vacc[]': 'ROR@11 Months',
      if (twelveMonth) 'other_vacc[]': 'VPI-HVB@12 Months',
      if (eighteenMonth) 'other_vacc[]': 'ROR@18 Months',
      if (sixYears) 'other_vacc[]': 'D-TCA@6 Years',
    });
    log(request.fields.toString());

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var v = jsonDecode(await response.stream.bytesToString());
    log(v.toString());
    if (response.statusCode == 200) {
      return v;
    } else {
      print(response.reasonPhrase);
      return v;
    }
  }
}
